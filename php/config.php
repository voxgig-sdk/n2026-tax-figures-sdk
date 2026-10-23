<?php
declare(strict_types=1);

// N2026TaxFigures SDK configuration

class N2026TaxFiguresConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "N2026TaxFigures",
                "slug" => "n2026-tax-figures",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "ratelimit" => [
          'options' => [
            'active' => false,
            'burst' => 5,
            'rate' => 5,
          ],
          'optspec' => [
            'now' => '`$FUNCTION`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "retry" => [
          'options' => [
            'active' => false,
            'factor' => 2,
            'maxDelay' => 2000,
            'minDelay' => 50,
            'retries' => 2,
            'statuses' => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          ],
          'optspec' => [
            'jitter' => '`$BOOLEAN`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "test" => [
          'options' => [
            'active' => false,
          ],
          'optspec' => [
            'entity' => '`$MAP`',
            'net' => '`$MAP`',
          ],
          'strict' => false,
          'transport' => 'base',
        ],
                "timeout" => [
          'options' => [
            'active' => false,
            'ms' => 30000,
          ],
          'optspec' => [
            'clearTimer' => '`$FUNCTION`',
            'now' => '`$FUNCTION`',
            'setTimer' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
            ],
            "options" => [
                "base" => "https://planomy.net",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "index" => [],
                    "tax_data" => [],
                ],
            ],
            "entity" => [
        'index' => [
          'fields' => [
            [
              'name' => 'years',
              'title' => 'Years',
              'type' => '`$ARRAY`',
            ],
          ],
          'name' => 'index',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/tax-data/index.json',
                  'segments' => [
                    [
                      'lit' => 'tax-data',
                    ],
                    [
                      'lit' => 'index.json',
                    ],
                  ],
                  'parts' => [
                    'tax-data',
                    'index.json',
                  ],
                  'rename' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.years`',
                  ],
                  'args' => [],
                  'select' => [],
                  'response' => [
                    'kind' => 'json',
                    'media' => 'application/json',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'tax_data' => [
          'fields' => [
            [
              'name' => 'contributionLimits',
              'title' => 'Contribution Limits',
              'type' => '`$OBJECT`',
              'short' => 'Employer plans, IRAs, SIMPLE, HSA and health FSA limits',
            ],
            [
              'name' => 'federal',
              'title' => 'Federal',
              'type' => '`$OBJECT`',
              'short' => 'Federal brackets and standard deduction',
            ],
            [
              'name' => 'fica',
              'title' => 'Fica',
              'type' => '`$OBJECT`',
              'short' => 'Payroll tax rates, wage base and Medicare thresholds',
            ],
            [
              'name' => 'lastUpdated',
              'title' => 'Last Updated',
              'type' => '`$STRING`',
              'format' => 'date',
            ],
            [
              'name' => 'medicare',
              'title' => 'Medicare',
              'type' => '`$OBJECT`',
              'short' => 'Premiums, deductibles and IRMAA tiers',
            ],
            [
              'name' => 'phaseOuts',
              'title' => 'Phase Outs',
              'type' => '`$OBJECT`',
              'short' => 'Roth IRA, traditional IRA deduction and Saver\'s Credit phase-outs',
            ],
            [
              'name' => 'publishedAt',
              'title' => 'Published At',
              'type' => '`$STRING`',
              'format' => 'date-time',
            ],
            [
              'name' => 'rmd',
              'title' => 'Rmd',
              'type' => '`$OBJECT`',
              'short' => 'Applicable ages and distribution rules',
            ],
            [
              'name' => 'socialSecurity',
              'title' => 'Social Security',
              'type' => '`$OBJECT`',
              'short' => 'COLA, wage base and earnings test amounts',
            ],
            [
              'name' => 'sources',
              'title' => 'Sources',
              'type' => '`$OBJECT`',
              'short' => 'Source ID to metadata',
            ],
            [
              'name' => 'states',
              'title' => 'States',
              'type' => '`$OBJECT`',
              'short' => 'State tax presets',
            ],
            [
              'name' => 'version',
              'title' => 'Version',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'year',
              'title' => 'Year',
              'type' => '`$INTEGER`',
            ],
          ],
          'name' => 'tax_data',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/tax-data/2026.json',
                  'segments' => [
                    [
                      'lit' => 'tax-data',
                    ],
                    [
                      'lit' => '2026.json',
                    ],
                  ],
                  'parts' => [
                    'tax-data',
                    '2026.json',
                  ],
                  'rename' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'args' => [],
                  'select' => [
                    '$action' => '2026',
                  ],
                  'response' => [
                    'kind' => 'json',
                    'media' => 'application/json',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return N2026TaxFiguresFeatures::make_feature($name);
    }
}
