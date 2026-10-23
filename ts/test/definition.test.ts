import { describe, test } from 'node:test'
import { SDK } from '..'
import { runDefinitionPoint } from './definition-runner'
import { isControlSkipped } from './utility'


// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN: any[] = [
  {
    "entity": "index",
    "accessor": "Index",
    "op": "list",
    "method": "GET",
    "path": "/tax-data/index.json",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": null,
    "status": 200,
    "sample": {
      "years": [
        1
      ]
    },
    "idField": "id"
  },
  {
    "entity": "tax_data",
    "accessor": "TaxData",
    "op": "load",
    "method": "GET",
    "path": "/tax-data/2026.json",
    "action": "2026",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": null,
    "status": 200,
    "sample": {
      "year": 2026,
      "version": "1.0",
      "publishedAt": "2026-01-02T00:00:00.000Z",
      "lastUpdated": "2026-01-02",
      "contributionLimits": {
        "elective401k": 24500,
        "ira": 7500
      },
      "socialSecurity": {
        "wageBase": 184500
      }
    },
    "idField": "id"
  }
]


describe('definition', () => {
  for (const point of PLAN) {
    test(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
      const control = isControlSkipped('entityOp', point.entity + '.' + point.op, 'definition')
      if (control.skip) {
        t.skip(control.reason || 'skipped via sdk-test-control.json')
        return
      }
      await runDefinitionPoint(SDK, point)
    })
  }
})
