package builder

import (
	"fmt"
	"strings"
)

// Lists (arrays)
type ListType struct {
	named
	items []Type
}

func List(name string, items ...Type) ListType {
	return ListType{named: named(name), items: items}
}

func (t ListType) String() string {
	s := ""
	for _, l := range t.items {
		s += fmt.Sprintf(", %s", l.String())
	}
	s = strings.TrimPrefix(s, ", ")
	return fmt.Sprintf("[%s]", s)
}

// ArrayComprehension generates: [ if c.name == name then transformFunc(c) else c for c in super.containers ]
type ArrayComprehensionType struct {
	named
	field      string // iteration variable, e.g. "c"
	source     Type   // e.g. super.containers
	matchField string // e.g. "name"
	matchValue Type   // e.g. name (the parameter)
	transform  Type   // e.g. transformFunc(c)
}

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

func (t ArrayComprehensionType) String() string {
	return fmt.Sprintf("[ if %s.%s == %s then %s else %s for %s in %s ]",
		t.field, t.matchField, t.matchValue.String(), t.transform.String(), t.field, t.field, t.source.String())
}
