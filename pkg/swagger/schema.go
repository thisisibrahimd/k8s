package swagger

import (
	"strings"
)

// Type represents a JSON Schema type string.
type Type string

const (
	TypeString Type = "string"
	TypeInt    Type = "integer"
	TypeBool   Type = "boolean"
	TypeObject Type = "object"
	TypeArray  Type = "array"
)

// Schema represents a parsed JSON Schema or OpenAPI definition,
// capturing type, description, nested properties, array items,
// $ref references (raw and resolved), Kubernetes scope, and
// vendor extensions like x-kubernetes-group-version-kind.
type Schema struct {
	// general
	Type Type   `json:"type"`
	Desc string `json:"description"`

	// type: object
	Props map[string]*Schema `json:"properties"`
	// type: array
	Items *Schema `json:"items"`

	// incomplete: reference
	DollarRef   *string `json:"$ref"`
	ResolvedRef string

	// Cluster or Namespaced scope, ignored if unset
	Scope *string

	// vendor extensions
	XGvk []XGvk `json:"x-kubernetes-group-version-kind"`
}

// XGvk represents a Kubernetes group/version/kind tuple from the
// x-kubernetes-group-version-kind vendor extension.
type XGvk struct {
	Group   string
	Kind    string
	Version string
}

// Ref returns the resolved reference name. If DollarRef is set, it
// strips the "#/definitions/" prefix. Otherwise returns ResolvedRef.
func (s Schema) Ref() string {
	if s.DollarRef == nil {
		return s.ResolvedRef
	}
	return strings.TrimPrefix(*s.DollarRef, "#/definitions/")
}

// GroupVersionKind returns the most specific x-kubernetes-group-version-kind
// entry from the schema. When multiple entries exist, it prefers entries
// with non-empty Group, Version, and Kind fields over empty ones.
// Returns (nil, false) if no XGVK entries exist.
func (s Schema) GroupVersionKind() (*XGvk, bool) {
	if len(s.XGvk) == 0 {
		return nil, false
	}

	// sometimes multiple XGVKs exist for the same schema. In this case we want to
	// select the most specific one.
	var x *XGvk
	for _, g := range s.XGvk {
		if x == nil || (x.Group == "" && g.Group != "") {
			x = &g
		}
		if x.Version == "" && g.Version != "" {
			x = &g
		}
		if x.Kind == "" && g.Kind != "" {
			x = &g
		}
	}
	// safeguard against malformed schemas with completely empty XGVKs
	if x == nil {
		return nil, false
	}
	return x, true
}
