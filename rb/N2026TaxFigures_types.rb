# frozen_string_literal: true

# Typed models for the N2026TaxFigures SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Index entity data model.
#
# @!attribute [rw] years
#   @return [Array, nil]
Index = Struct.new(
  :years,
  keyword_init: true
)

# Request payload for Index#list.
#
# @!attribute [rw] years
#   @return [Array, nil]
IndexListMatch = Struct.new(
  :years,
  keyword_init: true
)

# TaxData entity data model.
#
# @!attribute [rw] contributionLimits
#   @return [Hash, nil]
#
# @!attribute [rw] federal
#   @return [Hash, nil]
#
# @!attribute [rw] fica
#   @return [Hash, nil]
#
# @!attribute [rw] lastUpdated
#   @return [String, nil]
#
# @!attribute [rw] medicare
#   @return [Hash, nil]
#
# @!attribute [rw] phaseOuts
#   @return [Hash, nil]
#
# @!attribute [rw] publishedAt
#   @return [String, nil]
#
# @!attribute [rw] rmd
#   @return [Hash, nil]
#
# @!attribute [rw] socialSecurity
#   @return [Hash, nil]
#
# @!attribute [rw] sources
#   @return [Hash, nil]
#
# @!attribute [rw] states
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
#
# @!attribute [rw] year
#   @return [Integer, nil]
TaxData = Struct.new(
  :contributionLimits,
  :federal,
  :fica,
  :lastUpdated,
  :medicare,
  :phaseOuts,
  :publishedAt,
  :rmd,
  :socialSecurity,
  :sources,
  :states,
  :version,
  :year,
  keyword_init: true
)

# Request payload for TaxData#load.
#
# @!attribute [rw] contributionLimits
#   @return [Hash, nil]
#
# @!attribute [rw] federal
#   @return [Hash, nil]
#
# @!attribute [rw] fica
#   @return [Hash, nil]
#
# @!attribute [rw] lastUpdated
#   @return [String, nil]
#
# @!attribute [rw] medicare
#   @return [Hash, nil]
#
# @!attribute [rw] phaseOuts
#   @return [Hash, nil]
#
# @!attribute [rw] publishedAt
#   @return [String, nil]
#
# @!attribute [rw] rmd
#   @return [Hash, nil]
#
# @!attribute [rw] socialSecurity
#   @return [Hash, nil]
#
# @!attribute [rw] sources
#   @return [Hash, nil]
#
# @!attribute [rw] states
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
#
# @!attribute [rw] year
#   @return [Integer, nil]
TaxDataLoadMatch = Struct.new(
  :contributionLimits,
  :federal,
  :fica,
  :lastUpdated,
  :medicare,
  :phaseOuts,
  :publishedAt,
  :rmd,
  :socialSecurity,
  :sources,
  :states,
  :version,
  :year,
  keyword_init: true
)

