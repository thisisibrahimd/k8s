package swagger

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSchema_Ref_WithDollarRef(t *testing.T) {
	ref := "#/definitions/io.k8s.Foo"
	s := Schema{DollarRef: &ref}
	assert.Equal(t, "io.k8s.Foo", s.Ref())
}

func TestSchema_Ref_WithResolvedRef(t *testing.T) {
	s := Schema{DollarRef: nil, ResolvedRef: "io.k8s.Bar"}
	assert.Equal(t, "io.k8s.Bar", s.Ref())
}

func TestSchema_Ref_Neither(t *testing.T) {
	s := Schema{DollarRef: nil, ResolvedRef: ""}
	assert.Equal(t, "", s.Ref())
}

func TestGVK_Single(t *testing.T) {
	s := Schema{XGvk: []XGvk{
		{Group: "core", Kind: "Pod", Version: "v1"},
	}}
	gvk, ok := s.GroupVersionKind()
	require := assert.New(t)
	require.True(ok)
	require.NotNil(gvk)
	assert.Equal(t, "core", gvk.Group)
	assert.Equal(t, "Pod", gvk.Kind)
	assert.Equal(t, "v1", gvk.Version)
}

func TestGVK_Multiple_SelectMostSpecific(t *testing.T) {
	s := Schema{XGvk: []XGvk{
		{Group: "", Kind: "Foo", Version: "v1"},
		{Group: "ext.io", Kind: "Bar", Version: ""},
	}}
	gvk, ok := s.GroupVersionKind()
	require := assert.New(t)
	require.True(ok)
	require.NotNil(gvk)
	// Algorithm replaces pointer entirely when finding non-empty field.
	// First entry sets x = {Group:"", Kind:"Foo", Version:"v1"}
	// Second entry: x.Group is "" and g.Group is "ext.io" → x replaced with {Group:"ext.io", Kind:"Bar", Version:""}
	assert.Equal(t, "ext.io", gvk.Group)
	assert.Equal(t, "Bar", gvk.Kind)
	assert.Equal(t, "", gvk.Version)
}

func TestGVK_EmptySlice(t *testing.T) {
	s := Schema{XGvk: []XGvk{}}
	gvk, ok := s.GroupVersionKind()
	assert.False(t, ok)
	assert.Nil(t, gvk)
}

func TestGVK_PartialFields(t *testing.T) {
	s := Schema{XGvk: []XGvk{
		{Group: "", Kind: "", Version: ""},
		{Group: "apps", Kind: "", Version: "v1"},
		{Group: "", Kind: "Deployment", Version: ""},
	}}
	gvk, ok := s.GroupVersionKind()
	require := assert.New(t)
	require.True(ok)
	require.NotNil(gvk)
	// Algorithm replaces pointer entirely:
	// First entry: all empty → no change (x == nil but all fields empty, conditions not met)
	// Second entry: x.Group is "" → x = {Group:"apps", Kind:"", Version:"v1"}
	// Third entry: x.Group is "apps" (not "") → first condition false; x.Version is "v1" → second false; x.Kind is "" → x = {Group:"", Kind:"Deployment", Version:""}
	assert.Equal(t, "", gvk.Group)
	assert.Equal(t, "Deployment", gvk.Kind)
	assert.Equal(t, "", gvk.Version)
}

func TestSchema_Ref_Fuzz(t *testing.T) {
	tests := []struct {
		name     string
		dollar   string
		resolved string
		want     string
	}{
		{"normal ref", "#/definitions/io.k8s.Foo", "", "io.k8s.Foo"},
		{"deep ref", "#/definitions/io.k8s.api.core.v1.Pod", "", "io.k8s.api.core.v1.Pod"},
		{"empty ref", "", "", ""},
		{"partial prefix", "#/", "", "#/"},
		{"no prefix", "no-prefix", "", "no-prefix"},
		{"empty definition", "#/definitions/", "", ""},
		{"reserved keyword as ref", "#/definitions/function", "", "function"},
		{"reserved super as ref", "#/definitions/super", "", "super"},
		{"fallback to resolved", "", "io.k8s.Bar", "io.k8s.Bar"},
		{"both empty", "", "", ""},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			s := Schema{ResolvedRef: tt.resolved}
			if tt.dollar != "" {
				s.DollarRef = &tt.dollar
			}
			assert.Equal(t, tt.want, s.Ref())
		})
	}
}

func TestSchema_GroupVersionKind_Fuzz(t *testing.T) {
	tests := []struct {
		name    string
		gvks    []XGvk
		wantOK  bool
		wantGVK *XGvk
	}{
		{
			name:   "single full GVK",
			gvks:   []XGvk{{Group: "core", Kind: "Pod", Version: "v1"}},
			wantOK: true,
			wantGVK: &XGvk{Group: "core", Kind: "Pod", Version: "v1"},
		},
		{
			name:   "partial GVK",
			gvks:   []XGvk{{Group: "", Kind: "Foo", Version: ""}},
			wantOK: true,
			wantGVK: &XGvk{Group: "", Kind: "Foo", Version: ""},
		},
		{
			name:   "all empty fields",
			gvks:   []XGvk{{Group: "", Kind: "", Version: ""}},
			wantOK: true,
			wantGVK: &XGvk{Group: "", Kind: "", Version: ""},
		},
		{
			name:    "empty slice",
			gvks:    []XGvk{},
			wantOK:  false,
			wantGVK: nil,
		},
		{
			name:   "full GVK",
			gvks:   []XGvk{{Group: "group", Kind: "kind", Version: "version"}},
			wantOK: true,
			wantGVK: &XGvk{Group: "group", Kind: "kind", Version: "version"},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			s := Schema{XGvk: tt.gvks}
			gvk, ok := s.GroupVersionKind()
			assert.Equal(t, tt.wantOK, ok)
			if tt.wantGVK == nil {
				assert.Nil(t, gvk)
			} else {
				assert.Equal(t, tt.wantGVK, gvk)
			}
		})
	}
}
