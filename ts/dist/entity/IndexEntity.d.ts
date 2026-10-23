import { N2026TaxFiguresEntityBase } from '../N2026TaxFiguresEntityBase';
import type { N2026TaxFiguresSDK } from '../N2026TaxFiguresSDK';
import type { Control } from '../types';
import type { Index, IndexListMatch } from '../N2026TaxFiguresTypes';
declare class IndexEntity extends N2026TaxFiguresEntityBase<Index> {
    constructor(client: N2026TaxFiguresSDK, entopts: any);
    make(this: IndexEntity): IndexEntity;
    list(this: any, reqmatch?: IndexListMatch, ctrl?: Control): Promise<IndexEntity[]>;
}
export { IndexEntity };
