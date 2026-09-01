package swagger

import (
	"encoding/json"
)

// skipRefs contains definition references that should not be resolved.
// JSONSchemaProps entries are excluded because they are deeply recursive.
// ListMeta is excluded because list resources filter it out anyway.
var skipRefs = map[string]bool{
	// recursive
	"io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.JSONSchemaProps":      true,
	"io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaProps": true,

	// list will be filtered anyways
	"io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta": true,
}

// SwaggerLoader parses OpenAPI v2 (Swagger) JSON specs with a
// "definitions" top-level key. Resolves $ref references transitively,
// caching resolved definitions to handle recursive refs.
type SwaggerLoader struct {
	resolveMap  map[string]*Schema // store objects in a map in order to support recursive references
	Definitions Definitions        `json:"definitions"`
}

// Load unmarshals a Swagger JSON blob and resolves all $ref references
// within definitions. Skips known recursive refs (JSONSchemaProps, ListMeta)
// to avoid infinite recursion. Returns nil for missing ref targets.
func (s *SwaggerLoader) Load(data []byte) (Definitions, error) {
	if err := json.Unmarshal(data, &s); err != nil {
		return nil, err
	}
	s.resolveMap = map[string]*Schema{}

	for k, def := range s.Definitions {
		s.Definitions[k] = s.resolveRefs(def)
	}

	return s.Definitions, nil
}

func (s *SwaggerLoader) resolveRefs(d *Schema) *Schema {
	for key, prop := range d.Props {
		resolved := s.get(prop)
		if resolved != nil {
			resolved.Items = s.get(resolved.Items)
		}

		d.Props[key] = resolved
	}

	return d
}

func (s *SwaggerLoader) get(prop *Schema) *Schema {
	if prop == nil || prop.DollarRef == nil {
		return prop
	}

	ref := prop.Ref()
	if skipRefs[ref] {
		return prop
	}

	if rs, ok := s.resolveMap[ref]; ok {
		return rs
	}
	rs := s.Definitions[ref]

    // return if cannot resolve reference
	if rs == nil {
		return nil
	}

	rs.ResolvedRef = ref
	s.resolveMap[ref] = rs
	rs = s.resolveRefs(rs)
	return rs
}
