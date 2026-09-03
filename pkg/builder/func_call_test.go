package builder

import "testing"

func TestCallChain(t *testing.T) {
	tests := []struct {
		name  string
		n     string
		calls []CallType
	}{
		{
			name: "two calls",
			n:    "chained",
			calls: []CallType{
				Call("", "foo", Args(String("x", "1"))),
				Call("", "bar", Args(Int("y", 2))),
			},
		},
		{
			name: "three calls",
			n:    "chained",
			calls: []CallType{
				Call("", "a", Args(String("x", "1"))),
				Call("", "b", nil),
				Call("", "c", nil),
			},
		},
		{
			name: "four calls",
			n:    "chained",
			calls: []CallType{
				Call("", "a", Args(String("x", "1"))),
				Call("", "b", nil),
				Call("", "c", nil),
				Call("", "d", Args(Bool("z", true))),
			},
		},
		{
			name: "single with no args",
			n:    "single",
			calls: []CallType{
				Call("", "init", nil),
				Call("", "build", nil),
			},
		},
		{
			name: "mixed args and no args",
			n:    "mixed",
			calls: []CallType{
				Call("", "step1", Args(String("a", "1"))),
				Call("", "step2", nil),
				Call("", "step3", Args(Int("b", 2), Bool("c", true))),
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			chain := CallChain(tt.n, tt.calls...)
			o := Object("", String("call", chain.String()))
			assertRender(t, tt.name, o)
		})
	}
}

func TestCallChain_Panics(t *testing.T) {
	tests := []struct {
		name    string
		fn      func()
		wantMsg string
	}{
		{
			name:    "single call redundant",
			fn:      func() { CallChain("x", Call("", "foo", nil)) },
			wantMsg: "callChain with a single call is redundant",
		},
		{
			name:    "nil arg at index 0",
			fn:      func() { Call("x", "foo", []Type{nil}) },
			wantMsg: "argument `0` in call to `foo` is nil",
		},
		{
			name:    "nil arg at index 1",
			fn:      func() { Call("x", "foo", []Type{String("a", "1"), nil}) },
			wantMsg: "argument `1` in call to `foo` is nil",
		},
		{
			name:    "nil arg at index 2",
			fn:      func() { Call("x", "bar", []Type{Int("a", 1), Bool("b", true), nil}) },
			wantMsg: "argument `2` in call to `bar` is nil",
		},
		{
			name:    "nil arg in multi-arg call",
			fn:      func() { Call("x", "deploy", []Type{nil, String("name", "app"), nil}) },
			wantMsg: "argument `0` in call to `deploy` is nil",
		},
	}

	for _, tt := range tests {
		assertPanics(t, tt.name, tt.fn, tt.wantMsg)
	}
}
