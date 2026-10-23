<?php
declare(strict_types=1);

// N2026TaxFigures SDK utility: make_error

require_once __DIR__ . '/../core/Operation.php';
require_once __DIR__ . '/../core/Result.php';
require_once __DIR__ . '/../core/Error.php';

class N2026TaxFiguresMakeError
{
    public static function call(?N2026TaxFiguresContext $ctx, mixed $err): mixed
    {
        if ($ctx === null) {
            require_once __DIR__ . '/../core/Context.php';
            $ctx = new N2026TaxFiguresContext([], null);
        }
        $op = $ctx->op ?? new N2026TaxFiguresOperation([]);
        $opname = $op->name;
        if ($opname === '' || $opname === '_') {
            $opname = 'unknown operation';
        }

        $result = $ctx->result ?? new N2026TaxFiguresResult([]);
        $result->ok = false;

        if ($err === null) {
            $err = $result->err;
        }
        if ($err === null) {
            $err = $ctx->make_error('unknown', 'unknown error');
        }

        $errmsg = ($err instanceof N2026TaxFiguresError) ? $err->msg
            : (($err instanceof \Throwable) ? $err->getMessage() : (string)$err);
        $msg = "N2026TaxFiguresSDK: {$opname}: {$errmsg}";

        $result->err = null;
        $spec = $ctx->spec;

        $sdk_err = new N2026TaxFiguresError(
            ($err instanceof N2026TaxFiguresError) ? $err->sdk_code : '', $msg, $ctx);
        ($ctx->utility->clean)($ctx, $sdk_err);

        if ($ctx->ctrl->explain) {
            $ctx->ctrl->explain['err'] = ['message' => $sdk_err->msg];
            // A failure before done() leaves the record holding the live spec.
            ($ctx->utility->clean_explain)($ctx);
        }

        $sdk_err->result = ($ctx->utility->clean)($ctx, $result);
        $sdk_err->spec = ($ctx->utility->clean)($ctx, $spec);

        // Promote the HTTP status to the top level, so a consumer can branch
        // on `err->status` / `err->notFound()` rather than reaching into
        // `err->result`.
        $sdk_err->status = null === $result->status ? -1 : (int)$result->status;

        $ctx->ctrl->err = $sdk_err;

        // Fire PreUnexpected so observability features (metrics, telemetry,
        // audit, debug) close/record error paths that never reach PreDone
        // (e.g. a PrePoint rbac short-circuit). Fires after ctx.ctrl.err is set
        // so hooks can read the error; features guard against double-recording
        // when PreDone already fired.
        if (isset($ctx->utility) && isset($ctx->utility->feature_hook)) {
            $ctx->unexpected_fired = true;
            ($ctx->utility->feature_hook)($ctx, "PreUnexpected");
        }

        if ($ctx->ctrl->throw_err === false) {
            return $result->resdata;
        }
        throw $sdk_err;
    }
}
