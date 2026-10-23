import { IndexEntity } from './entity/IndexEntity';
import { TaxDataEntity } from './entity/TaxDataEntity';
export type * from './N2026TaxFiguresTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { N2026TaxFiguresEntityBase } from './N2026TaxFiguresEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
type DirectResult = {
    ok: false;
    err: any;
    status?: undefined;
    headers?: undefined;
    data?: undefined;
} | {
    ok: boolean;
    status: number;
    headers: any;
    data: any;
    err?: any;
};
declare class N2026TaxFiguresSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<DirectResult>;
    _rawRequest(fetchargs?: any): Promise<DirectResult>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Index(entopts?: Record<string, any>): IndexEntity;
    TaxData(entopts?: Record<string, any>): TaxDataEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): N2026TaxFiguresSDK;
    tester(testopts?: any, sdkopts?: any): N2026TaxFiguresSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof N2026TaxFiguresSDK;
export { stdutil, config, BaseFeature, N2026TaxFiguresEntityBase, N2026TaxFiguresSDK, SDK, };
export type { DirectResult };
