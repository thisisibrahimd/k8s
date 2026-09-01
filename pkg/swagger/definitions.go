package swagger

import (
	"regexp"
)

// Definitions is a map of schema names to their parsed Schema objects.
// Keys follow the convention "io.group.version.Kind" (Swagger) or
// "reversed.group.version.Kind" (CRDs).
type Definitions map[string]*Schema

// Filter returns a new Definitions map containing only entries for which
// the predicate function returns true.
func (ds Definitions) Filter(f func(k string, v Schema) bool) Definitions {
	out := make(Definitions)
	for k, v := range ds {
		if f(k, *v) {
			out[k] = v
		}
	}
	return out
}

// Sub returns a new Definitions map containing only entries whose keys
// match the given regular expression.
func (ds Definitions) Sub(exp string) Definitions {
	rg := regexp.MustCompile(exp)
	return ds.Filter(func(k string, v Schema) bool {
		return rg.MatchString(k)
	})
}

