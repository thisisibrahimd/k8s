// Package builder provides a functional API for generating Jsonnet code from Go.
//
// The package models Jsonnet constructs as Go types implementing the [Type] interface.
// Types compose hierarchically: primitives ([String], [Int], [Bool], [Null], [Float])
// serve as leaf nodes, while [Object], [List], [Func], [Call], and [IfThenElse] combine
// them into nested structures.
//
// # Building a Document
//
// The typical workflow is:
//
//  1. Build a [Type] tree using constructors.
//  2. Wrap it in a [Doc] (optionally with [Local] definitions).
//  3. Call [Doc.String] to render Jsonnet.
//
// Example:
//
//	o := Object("deploy",
//	    Func("new", Args(
//	        String("name", ""),
//	        Int("replicas", 1),
//	    ),
//	        Object("",
//	            Ref("apiVersion", `"apps/v1"`),
//	            Ref("kind", `"Deployment"`),
//	        ),
//	    ),
//	)
//	fmt.Println(Doc{Root: o})
//
// # Key Concepts
//
//   - [Type] is the core interface; all builder types implement [Type.String] and [Type.Name].
//   - [Object] children are keyed by [Type.Name]; duplicate keys panic.
//   - [FuncType.Args] formats parameters; [LargeFunc] puts each on its own line.
//   - [Required] and [CallArgFrom] mark arguments without default values.
//   - [Merge] produces "+:" (additive update), [Hidden] produces "::" (invisible field).
//
// # Converting Go Values
//
// Use [Marshal] to convert any JSON-serializable Go value into a builder [Type] tree.
// Numbers become [IntType], strings become [StringType], maps become [ObjectType],
// slices become [ListType], and nil becomes [NullType].
package builder

import (
	"fmt"
	"strings"
)

type named string

func (n named) Name() string {
	return string(n)
}

// Doc represents a complete Jsonnet document with optional local definitions.
//
// Locals are rendered as "local X = Y;" statements before the Root expression.
// Each local should have been created via [Local].
type Doc struct {
	Locals []LocalType
	Root   Type
}

// String renders the full document: locals followed by the root expression.
func (d Doc) String() string {
	s := ""
	for _, l := range d.Locals {
		s += fmt.Sprintf("local %s = %s;\n", l.Name(), l.String())
	}

	s += d.Root.String()
	return s
}

// Type is the interface implemented by all Jsonnet constructs.
//
// Every builder type implements String, which renders the Jsonnet output,
// and Name, which returns the identifier used as an object key or function name.
type Type interface {
	String() string
	Name() string
}

// indent prepends two spaces to each line of s.
// It is used when rendering nested Jsonnet blocks inside braces.
// Empty lines receive the prefix as well, preserving indentation structure.
func indent(s string) string {
	split := strings.Split(s, "\n")
	for i := range split {
		split[i] = "  " + split[i]
	}
	return strings.Join(split, "\n")
}

// dedent strips a two-space prefix from each line of s.
// It is the inverse of indent. Lines without the prefix are left unchanged
// (strings.TrimPrefix is safe on non-matching input).
func dedent(s string) string {
	split := strings.Split(s, "\n")
	for i := range split {
		split[i] = strings.TrimPrefix(split[i], "  ")
	}
	return strings.Join(split, "\n")
}
