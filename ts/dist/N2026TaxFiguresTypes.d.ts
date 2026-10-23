export interface Index {
    years?: any[];
}
export interface IndexListMatch {
    years?: any[];
}
export interface TaxData {
    contributionLimits?: Record<string, any>;
    federal?: Record<string, any>;
    fica?: Record<string, any>;
    lastUpdated?: string;
    medicare?: Record<string, any>;
    phaseOuts?: Record<string, any>;
    publishedAt?: string;
    rmd?: Record<string, any>;
    socialSecurity?: Record<string, any>;
    sources?: Record<string, any>;
    states?: Record<string, any>;
    version?: string;
    year?: number;
}
export interface TaxDataLoadMatch {
    contributionLimits?: Record<string, any>;
    federal?: Record<string, any>;
    fica?: Record<string, any>;
    lastUpdated?: string;
    medicare?: Record<string, any>;
    phaseOuts?: Record<string, any>;
    publishedAt?: string;
    rmd?: Record<string, any>;
    socialSecurity?: Record<string, any>;
    sources?: Record<string, any>;
    states?: Record<string, any>;
    version?: string;
    year?: number;
    $action?: string;
    [action: string]: any;
}
