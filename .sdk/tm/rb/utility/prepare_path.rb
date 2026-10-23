# N2026TaxFigures SDK utility: prepare_path
require_relative 'struct/voxgig_struct'
module N2026TaxFiguresUtilities
  PreparePath = ->(ctx) {
    point = ctx.point
    parts = []
    if point
      p = VoxgigStruct.getprop(point, "parts")
      parts = p if p.is_a?(Array)
    end
    VoxgigStruct.join(parts, "/", true)
  }
end
