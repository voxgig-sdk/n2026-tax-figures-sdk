# N2026TaxFigures SDK exists test

import pytest
from n2026taxfigures_sdk import N2026TaxFiguresSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = N2026TaxFiguresSDK.test(None, None)
        assert testsdk is not None
