<?php
declare(strict_types=1);

// N2026TaxFigures SDK utility: prepare_path

class N2026TaxFiguresPreparePath
{
    public static function call(N2026TaxFiguresContext $ctx): string
    {
        $point = $ctx->point;
        $parts = [];
        if ($point) {
            $p = \Voxgig\Struct\Struct::getprop($point, 'parts');
            if (is_array($p)) {
                $parts = $p;
            }
        }
        return \Voxgig\Struct\Struct::join($parts, '/', true);
    }
}
