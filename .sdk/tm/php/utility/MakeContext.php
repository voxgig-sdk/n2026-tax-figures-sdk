<?php
declare(strict_types=1);

// N2026TaxFigures SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class N2026TaxFiguresMakeContext
{
    public static function call(array $ctxmap, ?N2026TaxFiguresContext $basectx): N2026TaxFiguresContext
    {
        return new N2026TaxFiguresContext($ctxmap, $basectx);
    }
}
