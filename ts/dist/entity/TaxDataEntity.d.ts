import { N2026TaxFiguresEntityBase } from '../N2026TaxFiguresEntityBase';
import type { N2026TaxFiguresSDK } from '../N2026TaxFiguresSDK';
import type { Control } from '../types';
import type { TaxData, TaxDataLoadMatch } from '../N2026TaxFiguresTypes';
declare class TaxDataEntity extends N2026TaxFiguresEntityBase<TaxData> {
    constructor(client: N2026TaxFiguresSDK, entopts: any);
    make(this: TaxDataEntity): TaxDataEntity;
    load(this: any, reqmatch?: TaxDataLoadMatch, ctrl?: Control): Promise<TaxDataEntity>;
}
export { TaxDataEntity };
