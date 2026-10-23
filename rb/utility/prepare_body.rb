# N2026TaxFigures SDK utility: prepare_body
require_relative 'media'
module N2026TaxFiguresUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return N2026TaxFiguresUtilities.raw_body(ctx.reqdata) if N2026TaxFiguresUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
