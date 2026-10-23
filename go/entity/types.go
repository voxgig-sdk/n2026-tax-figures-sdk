// Typed models for the N2026TaxFigures SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/n2026-tax-figures-sdk/go/core"
)

// Index is the typed data model for the index entity.
type Index struct {
}

// IndexListMatch is the typed request payload for Index.ListTyped.
type IndexListMatch struct {
	Years *[]any `json:"years,omitempty"`
}

// TaxData is the typed data model for the tax_data entity.
type TaxData struct {
}

// TaxDataLoadMatch is the typed request payload for TaxData.LoadTyped.
type TaxDataLoadMatch struct {
	ContributionLimits *map[string]any `json:"contributionLimits,omitempty"`
	Federal *map[string]any `json:"federal,omitempty"`
	Fica *map[string]any `json:"fica,omitempty"`
	LastUpdated *string `json:"lastUpdated,omitempty"`
	Medicare *map[string]any `json:"medicare,omitempty"`
	PhaseOuts *map[string]any `json:"phaseOuts,omitempty"`
	PublishedAt *string `json:"publishedAt,omitempty"`
	Rmd *map[string]any `json:"rmd,omitempty"`
	SocialSecurity *map[string]any `json:"socialSecurity,omitempty"`
	Sources *map[string]any `json:"sources,omitempty"`
	States *map[string]any `json:"states,omitempty"`
	Version *string `json:"version,omitempty"`
	Year *int `json:"year,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
