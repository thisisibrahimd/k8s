package builder

import (
	"fmt"
	"strings"
)

// FuncType represents a Jsonnet function definition.
//
// String delegates to the return value; use Args to get the parameter list.
type FuncType struct {
	named
	args  []Type
	value Type
	large bool
}

// Func creates a function definition with default-valued arguments.
//
// Each argument renders as "name=value" unless wrapped in [Required] or [CallArgFrom].
func Func(name string, args []Type, returns Type) FuncType {
	return FuncType{
		named: named(name),
		args:  args,
		value: returns,
	}
}

// LargeFunc creates a function definition with each argument on its own line.
//
// Use for functions with many parameters for readability.
func LargeFunc(name string, args []Type, returns Type) FuncType {
	f := Func(name, args, returns)
	f.large = true
	return f
}

// Args returns the formatted argument list for the function.
//
// When large is true, each argument is on its own line with a leading comma.
func (f FuncType) Args() string {
	s := argsString(f.args, f.large)
	if f.large {
		return s + "\n"
	}
	return s
}

// String renders the function's return value.
func (f FuncType) String() string {
	return f.value.String()
}

// Args is a convenience for building argument slices inline.
//
// Returns the arguments unchanged; use with [Func] or [LargeFunc].
func Args(args ...Type) []Type {
	return args
}

// RequiredArgType wraps a type for use as a required function argument.
//
// Renders as just the name (no "=value"), e.g. "f(requiredArg)" instead of "f(requiredArg=)".
type RequiredArgType struct {
	value Type
}

// Name returns the wrapped type's name.
func (r RequiredArgType) Name() string {
	return r.value.Name()
}

// String returns the wrapped type's string representation.
func (r RequiredArgType) String() string {
	return r.value.String()
}

// Required wraps a type as a required function argument with no default value.
func Required(t Type) RequiredArgType {
	return RequiredArgType{t}
}

// CallArg wraps a type for use as a positional argument in function calls.
//
// Unlike [RequiredArgType], it outputs only the value without "name=".
type CallArg struct {
	value Type
}

// Name returns the wrapped type's string representation.
func (c CallArg) Name() string {
	return c.value.String()
}

// String returns the wrapped type's string representation.
func (c CallArg) String() string {
	return c.value.String()
}

// CallArgFrom creates a [CallArg] from the given type.
func CallArgFrom(t Type) CallArg {
	return CallArg{value: t}
}

// argsString formats a slice of function argument types into a comma-separated string.
//
// When breakLine is true, each argument is placed on its own line with a leading comma
// and two-space indent (used by [LargeFunc]). [RequiredArgType] and [CallArg] output only their
// name (no default value); all other types output "name=value".
func argsString(m []Type, breakLine bool) string {
	sep := SeparatorConcise
	if breakLine {
		sep = SeparatorLong + "  "
	}

	s := ""
	if breakLine {
		s = sep
	}

	for _, v := range m {
		if _, ok := v.(RequiredArgType); ok {
			s += fmt.Sprintf("%s"+sep, v.Name())
		} else if _, ok := v.(CallArg); ok {
			s += fmt.Sprintf("%s"+sep, v.Name())
		} else {
			s += fmt.Sprintf("%s=%s"+sep, v.Name(), v.String())
		}
	}

	if breakLine {
		s = strings.TrimPrefix(s, ",")
		s = strings.TrimSuffix(s, sep)
		return s
	}

	s = strings.TrimSuffix(s, sep)
	return s
}
