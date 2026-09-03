package builder

import "testing"

func TestRef(t *testing.T) {
	tests := []struct {
		name string
		n    string
		to   string
	}{
		{
			name: "testref-simple",
			n:    "r",
			to:   "x",
		},
		{
			name: "testref-dotted path",
			n:    "r",
			to:   "self.foo",
		},
		{
			name: "testref-super access",
			n:    "r",
			to:   "super.bar",
		},
		{
			name: "testref-with underscore",
			n:    "r",
			to:   "my_var",
		},
		{
			name: "testref-nested path",
			n:    "r",
			to:   "self.spec.containers",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			r := Ref(tt.n, tt.to)
			o := Object("", r)
			assertRender(t, tt.name, o)
		})
	}
}
