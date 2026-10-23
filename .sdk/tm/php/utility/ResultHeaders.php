<?php
declare(strict_types=1);

// N2026TaxFigures SDK utility: result_headers

class N2026TaxFiguresResultHeaders
{
    public static function call(N2026TaxFiguresContext $ctx): ?N2026TaxFiguresResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
