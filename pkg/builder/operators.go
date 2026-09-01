package builder

import (
	"fmt"
	"strings"
)

// MergeType represents an additive merge (+:) in Jsonnet.
//
// String and Name delegate to the wrapped type.
type MergeType struct {
	value Type
}

// String renders the wrapped type's string representation.
func (t MergeType) String() string {
	return t.value.String()
}

// Name returns the wrapped type's name.
func (t MergeType) Name() string {
	return t.value.Name()
}

// Merge creates an additive merge expression (+:).
//
// Panics if value is a [HiddenType]; [Hidden] must wrap [Merge] instead.
func Merge(value Type) MergeType {
	if _, ok := value.(HiddenType); ok {
		panic("HiddenType cannot be a child of MergeType, it must be the other way around.")
	}
	return MergeType{value}
}

// HiddenType represents a hidden field (::) in Jsonnet.
//
// Hidden fields are not visible when the object is rendered as JSON
// but are available for internal computation.
type HiddenType struct {
	value Type
}

// Hidden creates a hidden field (::).
//
// Panics if value is a [CommentType]; [Comment] must wrap [Hidden] instead.
func Hidden(value Type) HiddenType {
	if _, ok := value.(CommentType); ok {
		panic("CommentType cannot be a child of HiddenType, it must be the other way around.")
	}
	return HiddenType{value}
}

// Name returns the wrapped type's name.
func (h HiddenType) Name() string {
	return h.value.Name()
}

// String renders the wrapped type's string representation.
func (h HiddenType) String() string {
	return h.value.String()
}

// ArithType represents a Jsonnet arithmetic expression.
//
// String joins operands with the operator, e.g. "a + b + c".
type ArithType struct {
	named
	operator string
	operands []Type
}

// String renders the arithmetic expression, e.g. "1 + 2" or "x + y + z".
func (m ArithType) String() string {
	rendered := make([]string, len(m.operands))
	for i, o := range m.operands {
		rendered[i] = o.String()
	}

	s := strings.Join(rendered, fmt.Sprintf(" %s ", m.operator))
	return s
}

// Add creates an addition expression: a + b + ...
func Add(name string, o ...Type) ArithType {
	return ArithType{named: named(name), operator: "+", operands: o}
}

// Sub creates a subtraction expression: a - b - ...
func Sub(name string, o ...Type) ArithType {
	return ArithType{named: named(name), operator: "-", operands: o}
}

// Div creates a division expression: a / b / ...
func Div(name string, o ...Type) ArithType {
	return ArithType{named: named(name), operator: "/", operands: o}
}

// Mul creates a multiplication expression: a * b * ...
func Mul(name string, o ...Type) ArithType {
	return ArithType{named: named(name), operator: "*", operands: o}
}

// Mod creates a modulo expression: a % b
func Mod(name string, o ...Type) ArithType {
	return ArithType{named: named(name), operator: "%", operands: o}
}

// SprintfType stores a format template and values for Jsonnet string interpolation.
//
// Note: SprintfType has no String method; it is intended to be used as a value
// within other builder types.
type SprintfType struct {
	named
	template string
	values   []Type
}

// Sprintf creates a format expression for Jsonnet string interpolation.
//
// The template uses %s, %d, etc. placeholders, and values are substituted at render time.
func Sprintf(name, format string, values ...Type) SprintfType {
	return SprintfType{
		named:    named(name),
		template: format,
		values:   values,
	}
}
