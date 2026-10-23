package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewRatelimitFeatureFunc func() Feature

var NewRetryFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewTimeoutFeatureFunc func() Feature

var NewIndexEntityFunc func(client *N2026TaxFiguresSDK, entopts map[string]any) N2026TaxFiguresEntity

var NewTaxDataEntityFunc func(client *N2026TaxFiguresSDK, entopts map[string]any) N2026TaxFiguresEntity

