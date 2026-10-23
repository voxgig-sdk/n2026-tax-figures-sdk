# N2026TaxFigures SDK configuration


# The sekreto plugin DEFINITIONS the model selected per feature, imported
# above by name from the modules the catalogue's active `plugin.def`
# entries declare. Handed to each feature (secrets builds its Sekreto
# with them): a provider kind not listed here is unknown to that SDK.
FEATURE_PLUGINS = {
}


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "N2026TaxFigures",
            "slug": "n2026-tax-figures",
            "version": "0.0.1",
            "target": "py",
        },
        "feature": {
            "ratelimit": {
        "options": {
          "active": False,
          "burst": 5,
          "rate": 5,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "retry": {
        "options": {
          "active": False,
          "factor": 2,
          "maxDelay": 2000,
          "minDelay": 50,
          "retries": 2,
          "statuses": [
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          ],
        },
        "optspec": {
          "jitter": "`$BOOLEAN`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "test": {
        "options": {
          "active": False,
        },
        "optspec": {
          "entity": "`$MAP`",
          "net": "`$MAP`",
        },
        "strict": False,
        "transport": "base",
      },
            "timeout": {
        "options": {
          "active": False,
          "ms": 30000,
        },
        "optspec": {
          "clearTimer": "`$FUNCTION`",
          "now": "`$FUNCTION`",
          "setTimer": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
        },
        "options": {
            "base": "https://planomy.net",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "index": {},
                "tax_data": {},
            },
        },
        "entity": {
      "index": {
        "fields": [
          {
            "name": "years",
            "title": "Years",
            "type": "`$ARRAY`",
          },
        ],
        "name": "index",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/tax-data/index.json",
                "segments": [
                  {
                    "lit": "tax-data",
                  },
                  {
                    "lit": "index.json",
                  },
                ],
                "parts": [
                  "tax-data",
                  "index.json",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.years`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "tax_data": {
        "fields": [
          {
            "name": "contributionLimits",
            "title": "Contribution Limits",
            "type": "`$OBJECT`",
            "short": "Employer plans, IRAs, SIMPLE, HSA and health FSA limits",
          },
          {
            "name": "federal",
            "title": "Federal",
            "type": "`$OBJECT`",
            "short": "Federal brackets and standard deduction",
          },
          {
            "name": "fica",
            "title": "Fica",
            "type": "`$OBJECT`",
            "short": "Payroll tax rates, wage base and Medicare thresholds",
          },
          {
            "name": "lastUpdated",
            "title": "Last Updated",
            "type": "`$STRING`",
            "format": "date",
          },
          {
            "name": "medicare",
            "title": "Medicare",
            "type": "`$OBJECT`",
            "short": "Premiums, deductibles and IRMAA tiers",
          },
          {
            "name": "phaseOuts",
            "title": "Phase Outs",
            "type": "`$OBJECT`",
            "short": "Roth IRA, traditional IRA deduction and Saver's Credit phase-outs",
          },
          {
            "name": "publishedAt",
            "title": "Published At",
            "type": "`$STRING`",
            "format": "date-time",
          },
          {
            "name": "rmd",
            "title": "Rmd",
            "type": "`$OBJECT`",
            "short": "Applicable ages and distribution rules",
          },
          {
            "name": "socialSecurity",
            "title": "Social Security",
            "type": "`$OBJECT`",
            "short": "COLA, wage base and earnings test amounts",
          },
          {
            "name": "sources",
            "title": "Sources",
            "type": "`$OBJECT`",
            "short": "Source ID to metadata",
          },
          {
            "name": "states",
            "title": "States",
            "type": "`$OBJECT`",
            "short": "State tax presets",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$STRING`",
          },
          {
            "name": "year",
            "title": "Year",
            "type": "`$INTEGER`",
          },
        ],
        "name": "tax_data",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/tax-data/2026.json",
                "segments": [
                  {
                    "lit": "tax-data",
                  },
                  {
                    "lit": "2026.json",
                  },
                ],
                "parts": [
                  "tax-data",
                  "2026.json",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {
                  "$action": "2026",
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
