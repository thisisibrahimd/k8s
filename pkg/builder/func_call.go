package builder

import (
	"fmt"
	"strings"
)

// CallType represents a function call expression in Jsonnet.
type CallType struct {
	named
	funcName string
	args     []Type
}

// String renders the function call, e.g. "foo(x=1, y=2)".
//
// When more than 3 args are given, args are placed on separate lines.
func (c CallType) String() string {
	args := argsString(c.args, len(c.args) > 3)
	return fmt.Sprintf("%s(%s)", c.funcName, args)
}

// Call creates a function call expression.
//
// Panics if any argument in args is nil.
func Call(name, funcName string, args []Type) CallType {
	for k, v := range args {
		if v == nil {
			panic(fmt.Sprintf("argument `%v` in call to `%s` is nil", k, funcName))
		}
	}

	return CallType{
		named:    named(name),
		funcName: funcName,
		args:     args,
	}
}

// CallChain chains multiple function calls via dot notation.
//
// Each call's funcName is appended to the previous call's output with a dot.
// When more than one call is given, newlines are inserted between calls for readability.
// Panics if only one call is provided (use [Call] directly instead).
func CallChain(name string, calls ...CallType) CallType {
	if len(calls) == 1 {
		panic("callChain with a single call is redundant")
	}

	ln := ""
	if len(calls) > 1 {
		ln = "\n"
	}

	var last Type = Ref("", "")
	for i, c := range calls {
		last = Call("",
			strings.TrimPrefix(
				fmt.Sprintf("%s%s.%s", last.String(), ln, c.funcName),
				ln+".",
			),
			c.args,
		)

		if i == len(calls)-1 {
			l := last.(CallType)
			l.named = named(name)
			return l
		}
	}

	panic("loop did not return. This should never happen")
}
