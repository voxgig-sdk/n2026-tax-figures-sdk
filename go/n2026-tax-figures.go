package voxgign2026taxfiguressdk

import (
	"github.com/voxgig-sdk/n2026-tax-figures-sdk/go/core"
	"github.com/voxgig-sdk/n2026-tax-figures-sdk/go/entity"
	"github.com/voxgig-sdk/n2026-tax-figures-sdk/go/feature"
	_ "github.com/voxgig-sdk/n2026-tax-figures-sdk/go/utility"
)

// Type aliases preserve external API.
type N2026TaxFiguresSDK = core.N2026TaxFiguresSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type N2026TaxFiguresEntity = core.N2026TaxFiguresEntity
type StreamItem = core.StreamItem
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type N2026TaxFiguresError = core.N2026TaxFiguresError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewRatelimitFeatureFunc = func() core.Feature {
		return feature.NewRatelimitFeature()
	}
	core.NewRetryFeatureFunc = func() core.Feature {
		return feature.NewRetryFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewTimeoutFeatureFunc = func() core.Feature {
		return feature.NewTimeoutFeature()
	}
	core.NewIndexEntityFunc = func(client *core.N2026TaxFiguresSDK, entopts map[string]any) core.N2026TaxFiguresEntity {
		return entity.NewIndexEntity(client, entopts)
	}
	core.NewTaxDataEntityFunc = func(client *core.N2026TaxFiguresSDK, entopts map[string]any) core.N2026TaxFiguresEntity {
		return entity.NewTaxDataEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewN2026TaxFiguresSDK = core.NewN2026TaxFiguresSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var SharedConfig = core.SharedConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewN2026TaxFiguresSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *N2026TaxFiguresSDK  { return NewN2026TaxFiguresSDK(nil) }
func Test() *N2026TaxFiguresSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewRatelimitFeature = feature.NewRatelimitFeature
var NewRetryFeature = feature.NewRetryFeature
var NewTestFeature = feature.NewTestFeature
var NewTimeoutFeature = feature.NewTimeoutFeature
