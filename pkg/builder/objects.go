package builder

import (
	"fmt"
	"strings"
)

// SeparatorLong is the separator for multi-line object fields.
const SeparatorLong = ",\n"

// SeparatorConcise is the separator for single-line object fields.
const SeparatorConcise = ", "

// ObjectType represents a Jsonnet object (dictionary).
//
// Children are keyed by [Type.Name]; duplicate keys cause a panic.
// Keys containing -, ., /, starting with #, or reserved keywords are auto-quoted.
type ObjectType struct {
	named
	order    []string
	children map[string]Type
	concise  bool
}

// Object creates a Jsonnet object with the given children.
//
// Panics if two children have the same [Type.Name].
func Object(name string, children ...Type) ObjectType {
	c := make(map[string]Type)
	order := make([]string, len(children))
	i := 0
	for _, child := range children {
		if v, ok := c[child.Name()]; ok {
			panic(fmt.Sprintf("key clash: trying to add `%v` as `%s`, but `%v` already uses this key", child, child.Name(), v))
		}

		key := escapeKey(child.Name())
		c[key] = child
		order[i] = key
		i++
	}

	return ObjectType{
		named:    named(name),
		children: c,
		order:    order,
	}
}

// escapeKey returns a Jsonnet-safe identifier for s.
//
// Reserved keywords, strings starting with #, and strings containing -, ., or /
// are wrapped in single quotes. All other strings are returned unchanged.
func escapeKey(s string) string {
	switch s {
	case "assert", "else", "error", "false", "for", "function", "if",
		"import", "importstr", "in", "local", "null", "tailstrict",
		"then", "self", "super", "true":
		return fmt.Sprintf(`'%s'`, s)
	default:
		if strings.HasPrefix(s, "#") {
			return fmt.Sprintf(`'%s'`, s)
		}
		if strings.ContainsAny(s, "-./") {
			return fmt.Sprintf(`'%s'`, s)
		}
		return s
	}
}

// ConciseObject creates a Jsonnet object rendered on a single line.
//
// Fields are separated by ", " instead of newlines.
func ConciseObject(name string, children ...Type) ObjectType {
	o := Object(name, children...)
	o.concise = true
	return o
}

// String renders the object with each field on its own line.
//
// Returns "{}" for empty objects.
func (o ObjectType) String() string {
	if len(o.children) == 0 {
		return "{}"
	}
	if o.concise {
		return o.ConciseString()
	}

	s := printChildren(o.children, o.order, SeparatorLong)
	return fmt.Sprintf("{\n%s\n}", indent(s))
}

// ConciseString renders the object on a single line.
func (o ObjectType) ConciseString() string {
	s := printChildren(o.children, o.order, SeparatorConcise)
	return fmt.Sprintf("{ %s }", strings.TrimSuffix(s, ","))
}

// printChildren renders object children with the given separator.
func printChildren(children map[string]Type, order []string, s string) string {
	j := ""
	for _, name := range order {
		c := children[name]
		colon := ":"
		value := c.String()

		if cmt, ok := c.(CommentType); ok {
			c = cmt.value
			if s == SeparatorLong {
				j += cmt.Comment() + "\n"
			}
		}

		switch t := c.(type) {
		case FuncType:
			name = fmt.Sprintf("%s(%s)", name, t.Args())
		case HiddenType:
			colon = "::"
			switch h := t.value.(type) {
			case MergeType:
				colon = "+::"
			case FuncType:
				name = fmt.Sprintf("%s(%s)", name, h.Args())
			}
		case LocalType:
			colon = " ="
			// using t.Name() here (unescaped), cause we define an identifier
			name = "local " + t.Name()
		case MergeType:
			colon = "+:"
		}

		j += fmt.Sprintf("%s%s %s"+s, name, colon, value)

	}
	j = strings.TrimSuffix(j, s)
	return j
}
