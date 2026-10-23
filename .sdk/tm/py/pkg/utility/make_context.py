# N2026TaxFigures SDK utility: make_context

from projectname_sdk.core.context import N2026TaxFiguresContext


def make_context_util(ctxmap, basectx):
    return N2026TaxFiguresContext(ctxmap, basectx)
