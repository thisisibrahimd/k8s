package format

import (
	"github.com/google/go-jsonnet/formatter"
)

// Format validates and formats Jsonnet content.
//
// The path argument is used in error messages to identify the source file.
// Returns the formatted string, or an error if the content is invalid Jsonnet.
func Format(path string, content string) (string, error) {
	return formatter.Format(path, content, formatter.DefaultOptions())
}
