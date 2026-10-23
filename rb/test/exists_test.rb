# N2026TaxFigures SDK exists test

require "minitest/autorun"
require_relative "../N2026TaxFigures_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = N2026TaxFiguresSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
