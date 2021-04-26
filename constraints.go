package main

import (
	"strconv"

	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/token"
)

func getPrimitiveConstraints(prop Property, valueType ValueType) (constraints []ast.Expr, imports map[string]bool) {
	constraints = make([]ast.Expr, 0)
	imports = map[string]bool{}
	if prop.Value.ValueType != "" {
		if valueType.AllowedValues != nil {
			allowedValues := createExprFromAllowedValues(prop, valueType.AllowedValues, prop.getPrimitiveTypeString())
			constraints = append(constraints, allowedValues)
		}
		if valueType.NumberMax > 1 {
			min := valueType.NumberMin
			max := valueType.NumberMax
			allowedValues := createExprFromNumberMinMax(prop, min, max)
			constraints = append(constraints, allowedValues)
		}
		if valueType.StringMax > 0 {
			min := valueType.StringMin
			max := valueType.StringMax
			allowedValues := createExprFromStringMinMax(prop, int64(min), int64(max))
			constraints = append(constraints, allowedValues)
			imports["strings"] = true
		}
		if valueType.AllowedPatternRegex != "" {
			regex := valueType.AllowedPatternRegex
			allowedValues := createExprFromPatternRegex(prop, regex)
			constraints = append(constraints, allowedValues)
		}
		// Going to need to be smarter about this... I need to make sure that the marshalled JSON
		// string of this struct is less that JSONMax characters.
		// if valueType.JSONMax > 0 {
		// 	min := 0
		// 	max := valueType.JSONMax
		// 	allowedValues := createFieldFromStringMinMax(property, propertyResource, int64(min), int64(max))
		// 	propertyDecls = append(propertyDecls, allowedValues)
		// }
	}
	return constraints, imports
}

func createExprFromAllowedValues(prop Property, allowedValues []string, propertyType string) (expr ast.Expr) {
	for _, allowedValue := range allowedValues {
		var e ast.Expr
		if propertyType == "Integer" {
			e = &ast.BasicLit{Value: allowedValue}
		} else {
			e = ast.NewString(allowedValue)
		}
		if expr != nil {
			e = &ast.BinaryExpr{X: expr, Op: token.OR, Y: e}
		}
		expr = e
	}

	return expr
}

func createExprFromNumberMinMax(prop Property, min, max float64) (expr ast.Expr) {
	geq := &ast.UnaryExpr{
		Op: token.GEQ,
		X:  &ast.BasicLit{Kind: token.FLOAT, Value: strconv.FormatFloat(min, 'f', -1, 64)},
	}

	leq := &ast.UnaryExpr{
		Op: token.LEQ,
		X:  &ast.BasicLit{Kind: token.FLOAT, Value: strconv.FormatFloat(max, 'f', -1, 64)},
	}

	return &ast.BinaryExpr{X: geq, Op: token.AND, Y: leq}
}

func createExprFromStringMinMax(prop Property, min, max int64) (expr ast.Expr) {
	minLen := ast.NewCall(ast.NewSel(ast.NewIdent("strings"), "MinRunes"), &ast.BasicLit{Value: strconv.FormatInt(min, 10)})
	maxLen := ast.NewCall(ast.NewSel(ast.NewIdent("strings"), "MaxRunes"), &ast.BasicLit{Value: strconv.FormatInt(max, 10)})

	return &ast.BinaryExpr{X: minLen, Op: token.AND, Y: maxLen}
}

func createExprFromPatternRegex(prop Property, regex string) (expr ast.Expr) {
	return &ast.UnaryExpr{
		Op: token.MAT,
		X:  &ast.BasicLit{Kind: token.STRING, Value: "#\"" + regex + "\"#"},
	}
}
