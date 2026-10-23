-- Typed models for the N2026TaxFigures SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
-- params (op.<name>.points[].g.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Index
---@field years? table

---@class IndexListMatch
---@field years? table

---@class TaxData
---@field contributionLimits? table
---@field federal? table
---@field fica? table
---@field lastUpdated? string
---@field medicare? table
---@field phaseOuts? table
---@field publishedAt? string
---@field rmd? table
---@field socialSecurity? table
---@field sources? table
---@field states? table
---@field version? string
---@field year? number

---@class TaxDataLoadMatch
---@field contributionLimits? table
---@field federal? table
---@field fica? table
---@field lastUpdated? string
---@field medicare? table
---@field phaseOuts? table
---@field publishedAt? string
---@field rmd? table
---@field socialSecurity? table
---@field sources? table
---@field states? table
---@field version? string
---@field year? number

local M = {}

return M
