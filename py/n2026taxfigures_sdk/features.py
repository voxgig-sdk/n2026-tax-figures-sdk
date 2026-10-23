# N2026TaxFigures SDK feature factory

from n2026taxfigures_sdk.feature.base_feature import N2026TaxFiguresBaseFeature
from n2026taxfigures_sdk.feature.ratelimit_feature import N2026TaxFiguresRatelimitFeature
from n2026taxfigures_sdk.feature.retry_feature import N2026TaxFiguresRetryFeature
from n2026taxfigures_sdk.feature.test_feature import N2026TaxFiguresTestFeature
from n2026taxfigures_sdk.feature.timeout_feature import N2026TaxFiguresTimeoutFeature


_FEATURES = {
    "base": lambda: N2026TaxFiguresBaseFeature(),
    "ratelimit": lambda: N2026TaxFiguresRatelimitFeature(),
    "retry": lambda: N2026TaxFiguresRetryFeature(),
    "test": lambda: N2026TaxFiguresTestFeature(),
    "timeout": lambda: N2026TaxFiguresTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
