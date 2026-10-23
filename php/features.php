<?php
declare(strict_types=1);

// N2026TaxFigures SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/RatelimitFeature.php';
require_once __DIR__ . '/feature/RetryFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';
require_once __DIR__ . '/feature/TimeoutFeature.php';


class N2026TaxFiguresFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new N2026TaxFiguresBaseFeature();
            case "ratelimit":
                return new N2026TaxFiguresRatelimitFeature();
            case "retry":
                return new N2026TaxFiguresRetryFeature();
            case "test":
                return new N2026TaxFiguresTestFeature();
            case "timeout":
                return new N2026TaxFiguresTimeoutFeature();
            default:
                return new N2026TaxFiguresBaseFeature();
        }
    }

    /**
     * Does a generated feature class back this name? False for a name only
     * an options extend instance can supply (the station adopt path) - the
     * constructor uses this to skip make_feature for such names instead of
     * adding a stray BaseFeature.
     */
    public static function has_feature(string $name): bool
    {
        switch ($name) {
            case "base":
            case "ratelimit":
            case "retry":
            case "test":
            case "timeout":
                return true;
            default:
                return false;
        }
    }
}
