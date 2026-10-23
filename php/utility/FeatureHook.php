<?php
declare(strict_types=1);

// N2026TaxFigures SDK utility: feature_hook

class N2026TaxFiguresFeatureHook
{
    public static function call(N2026TaxFiguresContext $ctx, string $name): void
    {
        if (!$ctx->client) {
            return;
        }
        $features = $ctx->client->features ?? null;
        if (!$features) {
            return;
        }
        foreach ($features as $f) {
            if (method_exists($f, $name)) {
                $f->$name($ctx);
            }
        }
    }
}
