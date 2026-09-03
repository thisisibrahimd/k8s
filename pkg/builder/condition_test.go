package builder

import "testing"

func TestIfThenElse(t *testing.T) {
	tests := []struct {
		name string
		c    ConditionType
	}{
		{
			name: "testifthenelse-simple",
			c:    IfThenElse("c", Ref("", "x"), Ref("", "a"), Ref("", "b")),
		},
		{
			name: "testifthenelse-with literals",
			c:    IfThenElse("c", Bool("c", true), String("", "yes"), String("", "no")),
		},
		{
			name: "testifthenelse-nested",
			c: IfThenElse("c",
				Ref("", "a"),
				IfThenElse("", Ref("", "b"), Ref("", "x"), Ref("", "y")),
				Ref("", "z"),
			),
		},
		{
			name: "testifthenelse-with Int",
			c:    IfThenElse("c", Int("n", 0), Int("", 1), Int("", 2)),
		},
		{
			name: "testifthenelse-with default branches",
			c:    IfThenElse("c", Ref("", "x"), String("", "default"), String("", "fallback")),
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("", Ref("result", tt.c.String()))
			assertRender(t, tt.name, o)
		})
	}
}
