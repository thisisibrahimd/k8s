package builder

import "strings"

// CommentType wraps a type with an associated comment.
//
// String and Name delegate to the wrapped type.
// Comment returns the comment text prefixed with "// " on each line.
type CommentType struct {
	comment string
	value   Type
}

// Comment wraps a type with a comment that appears above it in long-form objects.
func Comment(value Type, comment string) CommentType {
	return CommentType{
		comment: comment,
		value:   value,
	}
}

// String renders the wrapped type's string representation.
func (t CommentType) String() string {
	return t.value.String()
}

// Name returns the wrapped type's name.
func (t CommentType) Name() string {
	return t.value.Name()
}

// Comment returns the comment text prefixed with "// " on each line.
//
// Only called when rendering objects in long form ([SeparatorLong]);
// concise objects omit comments entirely.
func (t CommentType) Comment() string {
	lines := strings.Split(t.comment, "\n")
	for i := range lines {
		lines[i] = "// " + lines[i]
	}
	return strings.Join(lines, "\n")
}
