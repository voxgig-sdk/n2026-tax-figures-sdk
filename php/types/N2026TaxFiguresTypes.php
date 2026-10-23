<?php
declare(strict_types=1);

// Typed models for the N2026TaxFigures SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Index entity data model. */
class Index
{
    public ?array $years = null;
}

/** Request payload for Index#list. */
class IndexListMatch
{
    public ?array $years = null;
}

/** TaxData entity data model. */
class TaxData
{
    public ?array $contributionLimits = null;
    public ?array $federal = null;
    public ?array $fica = null;
    public ?string $lastUpdated = null;
    public ?array $medicare = null;
    public ?array $phaseOuts = null;
    public ?string $publishedAt = null;
    public ?array $rmd = null;
    public ?array $socialSecurity = null;
    public ?array $sources = null;
    public ?array $states = null;
    public ?string $version = null;
    public ?int $year = null;
}

/** Request payload for TaxData#load. */
class TaxDataLoadMatch
{
    public ?array $contributionLimits = null;
    public ?array $federal = null;
    public ?array $fica = null;
    public ?string $lastUpdated = null;
    public ?array $medicare = null;
    public ?array $phaseOuts = null;
    public ?string $publishedAt = null;
    public ?array $rmd = null;
    public ?array $socialSecurity = null;
    public ?array $sources = null;
    public ?array $states = null;
    public ?string $version = null;
    public ?int $year = null;
}

