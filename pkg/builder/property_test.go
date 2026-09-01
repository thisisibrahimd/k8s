package builder

import (
	"strings"
	"testing"
	"unicode"
)

func TestProperty_DedentIndentInverse(t *testing.T) {
	inputs := []string{
		"  hello\n  world",
		"  a\n  b\n  c",
		"  single",
		"  \n  \n  ",
		"  foo\n  bar\n  baz",
	}

	for _, s := range inputs {
		got := dedent(indent(s))
		if got != s {
			t.Errorf("dedent(indent(%q)) = %q, want %q", s, got, s)
		}
	}
}

func TestProperty_EscapeKeyReserved(t *testing.T) {
	for kw := range reservedIdentifiers {
		result := escapeKey(kw)
		if !strings.HasPrefix(result, "'") || !strings.HasSuffix(result, "'") {
			t.Errorf("escapeKey(%q) = %q, reserved keywords must be quoted", kw, result)
		}
		if result != "'"+kw+"'" {
			t.Errorf("escapeKey(%q) = %q, want %q", kw, result, "'"+kw+"'")
		}
	}
}

func TestProperty_EscapeKeySafe(t *testing.T) {
	safeInputs := []string{
		"foo",
		"bar",
		"myVar",
		"my_var",
		"v1",
		"abc123",
		"CamelCase",
	}

	for _, s := range safeInputs {
		result := escapeKey(s)
		if result != s {
			t.Errorf("escapeKey(%q) = %q, want unchanged", s, result)
		}
	}
}

func TestProperty_EscapeKeyOutputIsValidIdentifier(t *testing.T) {
	inputs := []string{
		"foo",
		"function",
		"my-key",
		"api.version",
		"#hash",
		"v1",
		"abc_123",
	}

	for _, s := range inputs {
		result := escapeKey(s)
		if s == "" {
			continue
		}

		isQuoted := strings.HasPrefix(result, "'") && strings.HasSuffix(result, "'")
		if !isQuoted {
			for _, c := range result {
				if !unicode.IsLetter(c) && !unicode.IsDigit(c) && c != '_' {
					t.Errorf("escapeKey(%q) = %q, unquoted output contains invalid char %q", s, result, c)
				}
			}
			r := []rune(result)
			if len(r) > 0 && unicode.IsDigit(r[0]) {
				t.Errorf("escapeKey(%q) = %q, unquoted identifier must not start with digit", s, result)
			}
		}
	}
}

func TestProperty_MarshalTypeCorrectness(t *testing.T) {
	tests := []struct {
		name     string
		input    interface{}
		wantType Type
	}{
		{"int", 42, IntType{}},
		{"string", "hello", StringType{}},
		{"bool true", true, BoolType{}},
		{"bool false", false, BoolType{}},
		{"nil", nil, NullType{}},
		{"float64", float64(3.14), IntType{}},
		{"map", map[string]interface{}{"a": "b"}, ObjectType{}},
		{"slice", []interface{}{1, 2}, ListType{}},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := marshal("x", tt.input)
			if got == nil {
				t.Fatal("marshal returned nil")
			}

			switch tt.wantType.(type) {
			case IntType:
				if _, ok := got.(IntType); !ok {
					t.Errorf("marshal(%T) = %T, want IntType", tt.input, got)
				}
			case StringType:
				if _, ok := got.(StringType); !ok {
					t.Errorf("marshal(%T) = %T, want StringType", tt.input, got)
				}
			case BoolType:
				if _, ok := got.(BoolType); !ok {
					t.Errorf("marshal(%T) = %T, want BoolType", tt.input, got)
				}
			case NullType:
				if _, ok := got.(NullType); !ok {
					t.Errorf("marshal(%T) = %T, want NullType", tt.input, got)
				}
			case ObjectType:
				if _, ok := got.(ObjectType); !ok {
					t.Errorf("marshal(%T) = %T, want ObjectType", tt.input, got)
				}
			case ListType:
				if _, ok := got.(ListType); !ok {
					t.Errorf("marshal(%T) = %T, want ListType", tt.input, got)
				}
			}
		})
	}
}
