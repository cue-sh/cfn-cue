package main

import "cuelang.org/go/cue/ast"

const propertyPrefix = "prop"

func mapFromCFNTypeToCue(cfnType string) (lit ast.Expr) {
	switch cfnType {
	case "String":
		lit = &ast.BasicLit{Value: "string"}
	case "Integer", "Long":
		lit = &ast.BasicLit{Value: "int"}
	case "Double":
		lit = &ast.BasicLit{Value: "number"}
	case "Boolean":
		lit = &ast.BasicLit{Value: "bool"}
	case "Json":
		lit = &ast.StructLit{
			Elts: []ast.Decl{
				&ast.Field{
					Label: ast.NewList(&ast.BasicLit{Value: "string"}),
					Value: &ast.BasicLit{Value: "_"},
				},
			},
		}
	case "Map":
		lit = &ast.StructLit{}
	case "Timestamp":
		lit = &ast.BasicLit{Value: "time.Time"}
	default:
		// TODO clean this up... feels super ugly.
		lit = &ast.BasicLit{Value: propertyPrefix + cfnType}
	}
	return lit
}

func convertTypeToCUE(name string) string {
	switch name {
	case "String":
		return "string"
	case "Long":
		return "int"
	case "Integer":
		return "int"
	case "Double":
		return "number"
	case "Boolean":
		return "bool"
	case "Timestamp":
		return "time.Time"
	case "Json":
		return "struct"
	case "Map":
		return "struct"
	default:
		return name
	}
}

func (p Property) getPrimitiveTypeString() string {
	if p.IsPrimitive() {
		return p.PrimitiveType
	}

	if p.IsMap() && p.IsMapOfPrimitives() {
		return p.PrimitiveItemType
	}

	if p.IsList() && p.IsListOfPrimitives() {
		return p.PrimitiveItemType
	}

	return ""
}

func (p Property) getCUEPrimitiveType() ast.Expr {
	return mapFromCFNTypeToCue(p.getPrimitiveTypeString())
}
