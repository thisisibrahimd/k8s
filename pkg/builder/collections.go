package builder

import (
	"fmt"
	"strings"
)

// ListType represents a Jsonnet array.
//
// String renders items comma-separated inside brackets: [item1, item2, ...].
// An empty list renders as [].
type ListType struct {
	named
	items []Type
}

// List creates a Jsonnet array from the given items.
//
// Items are rendered in order, comma-separated, inside square brackets.
func List(name string, items ...Type) ListType {
	return ListType{named: named(name), items: items}
}

// String renders the array, e.g. [1, 2, 3] or [] when empty.
func (t ListType) String() string {
	s := ""
	for _, l := range t.items {
		s += fmt.Sprintf(", %s", l.String())
	}
	s = strings.TrimPrefix(s, ", ")
	return fmt.Sprintf("[%s]", s)
}

// ArrayComprehensionType generates a Jsonnet array comprehension that transforms
// a specific element in an array by matching on a field.
//
// Used for mapXyzByName helpers.
type ArrayComprehensionType struct {
	named
	field      string // iteration variable, e.g. "c"
	source     Type   // e.g. super.containers
	matchField string // e.g. "name"
	matchValue Type   // e.g. name (the parameter)
	transform  Type   // e.g. transformFunc(c)
}

// ArrayComprehension creates a mapXyzByName-style comprehension.
//
// It produces: [ if field.matchField == matchValue then transform else field for field in source ]
// This is used to transform a specific element in an array by matching on a field (typically "name").
func ArrayComprehension(name, field, matchField string, source, matchValue, transform Type) ArrayComprehensionType {
	return ArrayComprehensionType{
		named:      named(name),
		field:      field,
		source:     source,
		matchField: matchField,
		matchValue: matchValue,
		transform:  transform,
	}
}

// String renders the full comprehension expression.
func (t ArrayComprehensionType) String() string {
	return fmt.Sprintf("[ if %s.%s == %s then %s else %s for %s in %s ]",
		t.field, t.matchField, t.matchValue.String(), t.transform.String(), t.field, t.field, t.source.String())
}
