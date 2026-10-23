# N2026TaxFigures SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module N2026TaxFiguresFeatures
  def self.make_feature(name)
    case name
    when "base"
      N2026TaxFiguresBaseFeature.new
    when "ratelimit"
      N2026TaxFiguresRatelimitFeature.new
    when "retry"
      N2026TaxFiguresRetryFeature.new
    when "test"
      N2026TaxFiguresTestFeature.new
    when "timeout"
      N2026TaxFiguresTimeoutFeature.new
    else
      N2026TaxFiguresBaseFeature.new
    end
  end
end
