package builder

import "testing"

func TestSafeIdentifier(t *testing.T) {
	tests := []struct {
		name string
		in   string
		want string
	}{
		{"reserved function", "function", "function_"},
		{"reserved local", "local", "local_"},
		{"reserved if", "if", "if_"},
		{"safe identifier", "foo", "foo"},
		{"safe identifier with underscore", "bar", "bar"},
		{"reserved else", "else", "else_"},
		{"reserved self", "self", "self_"},
		{"reserved super", "super", "super_"},
		{"reserved true", "true", "true_"},
		{"reserved false", "false", "false_"},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := SafeIdentifier(tt.in)
			if got != tt.want {
				t.Errorf("SafeIdentifier(%q) = %q, want %q", tt.in, got, tt.want)
			}
		})
	}
}

func TestSafeString(t *testing.T) {
	tests := []struct {
		name     string
		funcName string
		key      string
	}{
		{
			name:     "function keyword",
			funcName: "withFunction",
			key:      "function",
		},
		{
			name:     "local keyword",
			funcName: "withLocal",
			key:      "local",
		},
		{
			name:     "if keyword",
			funcName: "withIf",
			key:      "if",
		},
		{
			name:     "safe identifier",
			funcName: "withName",
			key:      "name",
		},
		{
			name:     "self keyword",
			funcName: "withSelf",
			key:      "self",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("",
				Func(tt.funcName,
					Args(
						Required(SafeString(tt.key, "")),
					),
					Object("",
						Ref(tt.key, SafeIdentifier(tt.key)),
					),
				),
			)
			assertRender(t, tt.name, o)
		})
	}
}
