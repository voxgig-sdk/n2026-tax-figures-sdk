# N2026TaxFigures SDK utility: make_context
require_relative '../core/context'
module N2026TaxFiguresUtilities
  MakeContext = ->(ctxmap, basectx) {
    N2026TaxFiguresContext.new(ctxmap, basectx)
  }
end
