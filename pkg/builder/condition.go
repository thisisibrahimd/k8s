package builder

import "fmt"

// ConditionType represents a Jsonnet ternary expression: if X then Y else Z.
//
// Each branch (If, Then, Else) is a [Type], allowing nested conditions.
type ConditionType struct {
	name string
	If   Type
	Then Type
	Else Type
}

// Name returns the condition's identifier.
func (c ConditionType) Name() string {
	return c.name
}

// String renders the ternary expression, e.g. "if x then a else b".
func (c ConditionType) String() string {
	return fmt.Sprintf("if %s then %s else %s",
		c.If.String(),
		c.Then.String(),
		c.Else.String(),
	)
}

// IfThenElse creates a Jsonnet ternary expression.
//
// The If, Then, and Else branches can be any [Type], including nested conditions.
func IfThenElse(name string, If, Then, Else Type) ConditionType {
	return ConditionType{
		name: name,
		If:   If,
		Then: Then,
		Else: Else,
	}
}
