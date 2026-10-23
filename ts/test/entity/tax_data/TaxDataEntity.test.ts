

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { N2026TaxFiguresSDK, BaseFeature, config, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


loadEnvLocal(__dirname + '/../../../.env.local')


describe('TaxDataEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when N2026_TAX_FIGURES_TEST_LIVE=TRUE.
  afterEach(liveDelay('N2026_TAX_FIGURES_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = N2026TaxFiguresSDK.test()
    const ent = testsdk.TaxData()
    assert(null != ent)
  })


  test('validate', async (t) => {
    if (null == (config as any).feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = N2026TaxFiguresSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.TaxData().load({"lastUpdated":1} as any),
      (err: any) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    const live = 'TRUE' === process.env.N2026_TAX_FIGURES_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'tax_data.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"contributionLimits":{"a":true,"h":"Contribution Limits","n":"contributionLimits","r":false,"sh":"Employer plans, IRAs, SIMPLE, HSA and health FSA limits","t":"`$OBJECT`","key$":"contributionLimits","index$":0},"federal":{"a":true,"h":"Federal","n":"federal","r":false,"sh":"Federal brackets and standard deduction","t":"`$OBJECT`","key$":"federal","index$":1},"fica":{"a":true,"h":"Fica","n":"fica","r":false,"sh":"Payroll tax rates, wage base and Medicare thresholds","t":"`$OBJECT`","key$":"fica","index$":2},"lastUpdated":{"a":true,"fo":"date","h":"Last Updated","n":"lastUpdated","r":false,"t":"`$STRING`","key$":"lastUpdated","index$":3},"medicare":{"a":true,"h":"Medicare","n":"medicare","r":false,"sh":"Premiums, deductibles and IRMAA tiers","t":"`$OBJECT`","key$":"medicare","index$":4},"phaseOuts":{"a":true,"h":"Phase Outs","n":"phaseOuts","r":false,"sh":"Roth IRA, traditional IRA deduction and Saver's Credit phase-outs","t":"`$OBJECT`","key$":"phaseOuts","index$":5},"publishedAt":{"a":true,"fo":"date-time","h":"Published At","n":"publishedAt","r":false,"t":"`$STRING`","key$":"publishedAt","index$":6},"rmd":{"a":true,"h":"Rmd","n":"rmd","r":false,"sh":"Applicable ages and distribution rules","t":"`$OBJECT`","key$":"rmd","index$":7},"socialSecurity":{"a":true,"h":"Social Security","n":"socialSecurity","r":false,"sh":"COLA, wage base and earnings test amounts","t":"`$OBJECT`","key$":"socialSecurity","index$":8},"sources":{"a":true,"h":"Sources","n":"sources","r":false,"sh":"Source ID to metadata","t":"`$OBJECT`","key$":"sources","index$":9},"states":{"a":true,"h":"States","n":"states","r":false,"sh":"State tax presets","t":"`$OBJECT`","key$":"states","index$":10},"version":{"a":true,"h":"Version","n":"version","r":false,"t":"`$STRING`","key$":"version","index$":11},"year":{"a":true,"h":"Year","n":"year","r":false,"t":"`$INTEGER`","key$":"year","index$":12}},"name":"tax_data","op":{"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /tax-data/2026.json","source":"openapi3","version":2},"g":{},"k":"http","m":"GET","o":"/tax-data/2026.json","q":{"$action":"2026"},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"tax-data"},{"lit":"2026.json"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"tax_data","name__orig":"tax_data","Name":"TaxData","name_":"tax_data","name-":"tax-data","NAME":"TAX_DATA","index$":1}, {"active":true,"entity":"tax_data","key$":"BasicTaxDataFlow","kind":"basic","name":"BasicTaxDataFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"tax_data_ref01","srcdatavar":"tax_data_ref01_data","suffix":"_dt0"},"m":{},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-tax_data_ref01"}}],"index$":0}]}, 'TaxData', {"GET /tax-data/2026.json":{"protocol":"http","parameters":[]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let tax_data_ref01_data = Object.values(setup.data.existing.tax_data)[0] as any

    // LOAD
    const tax_data_ref01_ent = client.TaxData()
    const tax_data_ref01_match_dt0: any = {}
    const tax_data_ref01_data_dt0 = (await tax_data_ref01_ent.load(tax_data_ref01_match_dt0)).data()
    assert(null != tax_data_ref01_data_dt0)


  })
})



// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const LIVE_STRICT = true

function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/tax_data/TaxDataTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = N2026TaxFiguresSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['tax_data01','tax_data02','tax_data03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'N2026_TAX_FIGURES_TEST_TAX_DATA_ENTID': idmap,
    'N2026_TAX_FIGURES_TEST_LIVE': 'FALSE',
    'N2026_TAX_FIGURES_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['N2026_TAX_FIGURES_TEST_TAX_DATA_ENTID']

  const live = 'TRUE' === env.N2026_TAX_FIGURES_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['N2026_TAX_FIGURES_TEST_TAX_DATA_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new N2026TaxFiguresSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.N2026_TAX_FIGURES_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
