
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { N2026TaxFiguresSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = N2026TaxFiguresSDK.test()
    equal(testsdk instanceof N2026TaxFiguresSDK, true,
      'N2026TaxFiguresSDK.test() must return a client synchronously')
  })

})
