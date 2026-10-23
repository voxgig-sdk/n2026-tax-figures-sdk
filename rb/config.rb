# N2026TaxFigures SDK configuration

module N2026TaxFiguresConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "N2026TaxFigures",
        "slug" => "n2026-tax-figures",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "now" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://planomy.net",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "index" => {},
          "tax_data" => {},
        },
      },
      "entity" => {
        "index" => {
          "fields" => [
            {
              "name" => "years",
              "title" => "Years",
              "type" => "`$ARRAY`",
            },
          ],
          "name" => "index",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/tax-data/index.json",
                  "segments" => [
                    {
                      "lit" => "tax-data",
                    },
                    {
                      "lit" => "index.json",
                    },
                  ],
                  "parts" => [
                    "tax-data",
                    "index.json",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.years`",
                  },
                  "args" => {},
                  "select" => {},
                  "response" => {
                    "kind" => "json",
                    "media" => "application/json",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "tax_data" => {
          "fields" => [
            {
              "name" => "contributionLimits",
              "title" => "Contribution Limits",
              "type" => "`$OBJECT`",
              "short" => "Employer plans, IRAs, SIMPLE, HSA and health FSA limits",
            },
            {
              "name" => "federal",
              "title" => "Federal",
              "type" => "`$OBJECT`",
              "short" => "Federal brackets and standard deduction",
            },
            {
              "name" => "fica",
              "title" => "Fica",
              "type" => "`$OBJECT`",
              "short" => "Payroll tax rates, wage base and Medicare thresholds",
            },
            {
              "name" => "lastUpdated",
              "title" => "Last Updated",
              "type" => "`$STRING`",
              "format" => "date",
            },
            {
              "name" => "medicare",
              "title" => "Medicare",
              "type" => "`$OBJECT`",
              "short" => "Premiums, deductibles and IRMAA tiers",
            },
            {
              "name" => "phaseOuts",
              "title" => "Phase Outs",
              "type" => "`$OBJECT`",
              "short" => "Roth IRA, traditional IRA deduction and Saver's Credit phase-outs",
            },
            {
              "name" => "publishedAt",
              "title" => "Published At",
              "type" => "`$STRING`",
              "format" => "date-time",
            },
            {
              "name" => "rmd",
              "title" => "Rmd",
              "type" => "`$OBJECT`",
              "short" => "Applicable ages and distribution rules",
            },
            {
              "name" => "socialSecurity",
              "title" => "Social Security",
              "type" => "`$OBJECT`",
              "short" => "COLA, wage base and earnings test amounts",
            },
            {
              "name" => "sources",
              "title" => "Sources",
              "type" => "`$OBJECT`",
              "short" => "Source ID to metadata",
            },
            {
              "name" => "states",
              "title" => "States",
              "type" => "`$OBJECT`",
              "short" => "State tax presets",
            },
            {
              "name" => "version",
              "title" => "Version",
              "type" => "`$STRING`",
            },
            {
              "name" => "year",
              "title" => "Year",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "tax_data",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/tax-data/2026.json",
                  "segments" => [
                    {
                      "lit" => "tax-data",
                    },
                    {
                      "lit" => "2026.json",
                    },
                  ],
                  "parts" => [
                    "tax-data",
                    "2026.json",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {},
                  "select" => {
                    "$action" => "2026",
                  },
                  "response" => {
                    "kind" => "json",
                    "media" => "application/json",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    N2026TaxFiguresFeatures.make_feature(name)
  end
end
