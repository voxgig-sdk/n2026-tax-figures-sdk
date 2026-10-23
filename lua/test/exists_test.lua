-- N2026TaxFigures SDK exists test

local sdk = require("n2026-tax-figures_sdk")

describe("N2026TaxFiguresSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
