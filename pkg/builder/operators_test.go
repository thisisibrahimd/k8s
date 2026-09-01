package builder

import "testing"

func TestArithType(t *testing.T) {
	tests := []struct {
		name string
		n    string
		ctor func(string, ...Type) ArithType
		args []Type
	}{
		{
			name: "add two",
			n:    "sum",
			ctor: Add,
			args: []Type{Int("a", 1), Int("b", 2)},
		},
		{
			name: "add three",
			n:    "sum",
			ctor: Add,
			args: []Type{Int("a", 1), Int("b", 2), Int("c", 3)},
		},
		{
			name: "sub two",
			n:    "diff",
			ctor: Sub,
			args: []Type{Int("a", 10), Int("b", 3)},
		},
		{
			name: "div two",
			n:    "ratio",
			ctor: Div,
			args: []Type{Int("a", 10), Int("b", 2)},
		},
		{
			name: "mul two",
			n:    "product",
			ctor: Mul,
			args: []Type{Int("a", 3), Int("b", 4)},
		},
		{
			name: "mod two",
			n:    "remainder",
			ctor: Mod,
			args: []Type{Int("a", 10), Int("b", 3)},
		},
		{
			name: "add with strings",
			n:    "concat",
			ctor: Add,
			args: []Type{String("a", "hello"), String("b", " world")},
		},
		{
			name: "mul with floats",
			n:    "area",
			ctor: Mul,
			args: []Type{Float("width", 3.5), Float("height", 2.0)},
		},
		{
			name: "sub with refs",
			n:    "delta",
			ctor: Sub,
			args: []Type{Ref("old", "self.oldValue"), Ref("new", "self.newValue")},
		},
		{
			name: "div single operand",
			n:    "identity",
			ctor: Div,
			args: []Type{Int("a", 42)},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := Object("", tt.ctor(tt.n, tt.args...))
			assertRender(t, o)
		})
	}
}

func TestMerge_Panics(t *testing.T) {
	tests := []struct {
		name    string
		fn      func()
		wantMsg string
	}{
		{
			name:    "hidden string",
			fn:      func() { Merge(Hidden(String("x", "1"))) },
			wantMsg: "HiddenType cannot be a child of MergeType",
		},
		{
			name:    "hidden int",
			fn:      func() { Merge(Hidden(Int("x", 1))) },
			wantMsg: "HiddenType cannot be a child of MergeType",
		},
		{
			name:    "hidden object",
			fn:      func() { Merge(Hidden(Object("x"))) },
			wantMsg: "HiddenType cannot be a child of MergeType",
		},
		{
			name:    "hidden func",
			fn:      func() { Merge(Hidden(Func("f", nil, Ref("", "x")))) },
			wantMsg: "HiddenType cannot be a child of MergeType",
		},
		{
			name:    "hidden list",
			fn:      func() { Merge(Hidden(List("x", Int("", 1)))) },
			wantMsg: "HiddenType cannot be a child of MergeType",
		},
	}

	for _, tt := range tests {
		assertPanics(t, tt.name, tt.fn, tt.wantMsg)
	}
}

func TestHidden_Panics(t *testing.T) {
	tests := []struct {
		name    string
		fn      func()
		wantMsg string
	}{
		{
			name:    "comment string",
			fn:      func() { Hidden(Comment(String("x", "1"), "a comment")) },
			wantMsg: "CommentType cannot be a child of HiddenType",
		},
		{
			name:    "comment int",
			fn:      func() { Hidden(Comment(Int("x", 1), "note")) },
			wantMsg: "CommentType cannot be a child of HiddenType",
		},
		{
			name:    "comment object",
			fn:      func() { Hidden(Comment(Object("x"), "descr")) },
			wantMsg: "CommentType cannot be a child of HiddenType",
		},
		{
			name:    "comment bool",
			fn:      func() { Hidden(Comment(Bool("x", true), "flag")) },
			wantMsg: "CommentType cannot be a child of HiddenType",
		},
		{
			name:    "comment ref",
			fn:      func() { Hidden(Comment(Ref("x", "y"), "ref note")) },
			wantMsg: "CommentType cannot be a child of HiddenType",
		},
	}

	for _, tt := range tests {
		assertPanics(t, tt.name, tt.fn, tt.wantMsg)
	}
}

func TestSprintfType(t *testing.T) {
	tests := []struct {
		name     string
		template string
		values   []Type
	}{
		{
			name:     "single string",
			template: "Hello, %s!",
			values:   []Type{String("name", "World")},
		},
		{
			name:     "int format",
			template: "Count: %d",
			values:   []Type{Int("count", 42)},
		},
		{
			name:     "multiple values",
			template: "%s has %d items",
			values:   []Type{String("name", "list"), Int("count", 5)},
		},
		{
			name:     "float format",
			template: "Price: $%.2f",
			values:   []Type{Float("price", 19.99)},
		},
		{
			name:     "bool format",
			template: "Enabled: %s",
			values:   []Type{Bool("flag", true)},
		},
		{
			name:     "no values",
			template: "static string",
			values:   []Type{},
		},
		{
			name:     "ref in values",
			template: "Using %s",
			values:   []Type{Ref("val", "self.value")},
		},
		{
			name:     "mixed types",
			template: "%s: %d (%.1f%%)",
			values:   []Type{String("label", "score"), Int("value", 85), Float("pct", 85.0)},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			s := Sprintf(tt.name, tt.template, tt.values...)
			if s.Name() != tt.name {
				t.Errorf("Sprintf().Name() = %q, want %q", s.Name(), tt.name)
			}
		})
	}
}
