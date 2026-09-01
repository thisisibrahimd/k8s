package builder

import (
	"strings"
	"testing"
	"unicode"
)

func FuzzEscapeKey(f *testing.F) {
	f.Add("function")
	f.Add("local")
	f.Add("if")
	f.Add("foo")
	f.Add("my-key")
	f.Add("api.version")
	f.Add("v1")
	f.Add("")
	f.Add("#comment")
	f.Add("path/to/resource")

	f.Fuzz(func(t *testing.T, input string) {
		result := escapeKey(input)

		if input == "" {
			return
		}

		r := []rune(input)
		isReserved := false
		for kw := range reservedIdentifiers {
			if input == kw {
				isReserved = true
				break
			}
		}
		hasHashPrefix := len(r) > 0 && r[0] == '#'
		hasSpecialChar := false
		for _, c := range r {
			if !unicode.IsLetter(c) && !unicode.IsDigit(c) && c != '_' {
				hasSpecialChar = true
				break
			}
		}

		if isReserved || hasHashPrefix || hasSpecialChar {
			if !strings.HasPrefix(result, "'") || !strings.HasSuffix(result, "'") {
				t.Errorf("escapeKey(%q) = %q, expected quoted string for reserved/special input", input, result)
			}
		}
	})
}

func FuzzMarshal(f *testing.F) {
	f.Add(int64(0), "hello", true, float64(3.14))
	f.Add(int64(1), "world", false, float64(2.71))
	f.Add(int64(2), "test", true, float64(1.0))
	f.Add(int64(3), "foo", false, float64(0.0))

	f.Fuzz(func(t *testing.T, input int64, strVal string, boolVal bool, floatVal float64) {
		var result Type
		switch input % 4 {
		case 0:
			result = marshal("x", strVal)
		case 1:
			result = marshal("x", int(input))
		case 2:
			result = marshal("x", boolVal)
		case 3:
			result = marshal("x", floatVal)
		}

		if result == nil {
			t.Error("marshal returned nil Type")
		}
	})
}

func FuzzIndent(f *testing.F) {
	f.Add("hello")
	f.Add("hello\nworld")
	f.Add("")
	f.Add("\n")
	f.Add("  already indented")

	f.Fuzz(func(t *testing.T, input string) {
		result := indent(input)

		lines := strings.Split(result, "\n")
		for i, line := range lines {
			if len(line) < 2 || line[:2] != "  " {
				t.Errorf("indent: line %d = %q, expected 2-space prefix", i, line)
			}
		}

		if strings.Count(result, "\n") != strings.Count(input, "\n") {
			t.Errorf("indent: newline count mismatch: got %d, want %d",
				strings.Count(result, "\n"), strings.Count(input, "\n"))
		}
	})
}

func FuzzDedent(f *testing.F) {
	f.Add("  hello")
	f.Add("  hello\n  world")
	f.Add("")
	f.Add("no indent")
	f.Add("    double indent")

	f.Fuzz(func(t *testing.T, input string) {
		result := dedent(input)

		for i, line := range strings.Split(result, "\n") {
			if strings.HasPrefix(line, "    ") {
				t.Errorf("dedent: line %d = %q, should have at least 2-space prefix stripped", i, line)
			}
		}

		if strings.Count(result, "\n") != strings.Count(input, "\n") {
			t.Errorf("dedent: newline count mismatch: got %d, want %d",
				strings.Count(result, "\n"), strings.Count(input, "\n"))
		}
	})
}
