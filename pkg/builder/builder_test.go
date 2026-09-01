package builder

import "testing"

func TestIndent(t *testing.T) {
	tests := []struct {
		name  string
		input string
		want  string
	}{
		{
			name:  "single line",
			input: "hello",
			want:  "  hello",
		},
		{
			name:  "multi line",
			input: "a\nb",
			want:  "  a\n  b",
		},
		{
			name:  "empty line between",
			input: "a\n\nb",
			want:  "  a\n  \n  b",
		},
		{
			name:  "empty string",
			input: "",
			want:  "  ",
		},
		{
			name:  "leading newline",
			input: "\nhello",
			want:  "  \n  hello",
		},
		{
			name:  "trailing newline",
			input: "hello\n",
			want:  "  hello\n  ",
		},
		{
			name:  "already indented",
			input: "  hello",
			want:  "    hello",
		},
		{
			name:  "only newlines",
			input: "\n\n",
			want:  "  \n  \n  ",
		},
		{
			name:  "only spaces",
			input: "  ",
			want:  "    ",
		},
		{
			name:  "spaces in middle",
			input: "a  b",
			want:  "  a  b",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := indent(tt.input)
			if got != tt.want {
				t.Errorf("indent(%q) = %q, want %q", tt.input, got, tt.want)
			}
		})
	}
}

func TestDedent(t *testing.T) {
	tests := []struct {
		name  string
		input string
		want  string
	}{
		{
			name:  "single indented",
			input: "  hello",
			want:  "hello",
		},
		{
			name:  "multi indented",
			input: "  a\n  b",
			want:  "a\nb",
		},
		{
			name:  "no indent",
			input: "hello",
			want:  "hello",
		},
		{
			name:  "empty string",
			input: "",
			want:  "",
		},
		{
			name:  "partial indent (one space)",
			input: " hello",
			want:  " hello",
		},
		{
			name:  "double indent (strips one level)",
			input: "    hello",
			want:  "  hello",
		},
		{
			name:  "empty lines",
			input: "  \n  ",
			want:  "\n",
		},
		{
			name:  "trailing newline",
			input: "  hello\n",
			want:  "hello\n",
		},
		{
			name:  "mixed indent",
			input: "  a\n  b",
			want:  "a\nb",
		},
		{
			name:  "over-dedent safe",
			input: "a",
			want:  "a",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := dedent(tt.input)
			if got != tt.want {
				t.Errorf("dedent(%q) = %q, want %q", tt.input, got, tt.want)
			}
		})
	}
}
