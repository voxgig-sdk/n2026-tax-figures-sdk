// Typed models for the N2026TaxFigures SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Index {
  years?: any[]
}

export interface IndexListMatch {
  years?: any[]
}

export interface TaxData {
  contributionLimits?: Record<string, any>
  federal?: Record<string, any>
  fica?: Record<string, any>
  lastUpdated?: string
  medicare?: Record<string, any>
  phaseOuts?: Record<string, any>
  publishedAt?: string
  rmd?: Record<string, any>
  socialSecurity?: Record<string, any>
  sources?: Record<string, any>
  states?: Record<string, any>
  version?: string
  year?: number
}

export interface TaxDataLoadMatch {
  contributionLimits?: Record<string, any>
  federal?: Record<string, any>
  fica?: Record<string, any>
  lastUpdated?: string
  medicare?: Record<string, any>
  phaseOuts?: Record<string, any>
  publishedAt?: string
  rmd?: Record<string, any>
  socialSecurity?: Record<string, any>
  sources?: Record<string, any>
  states?: Record<string, any>
  version?: string
  year?: number

  // Selects a custom action instead of the plain load:
  //   '2026'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

