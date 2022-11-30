import { MARKETPLACE_NAME } from "./envs";
export const IMPL_ID = "implementation";
export const PROXY_ID = "proxy";
export const ACCOUNT_IMPL_ID = `account_${ IMPL_ID }`;
export const ACCOUNT_PROXY_ID = `account_${ PROXY_ID }_${ MARKETPLACE_NAME }`;

export const GIG_IMPL_ID = `gig_${ IMPL_ID }`;

export const ACL_MANAGER_ID = `acl_manager_${ MARKETPLACE_NAME }`;
export const ADDRESSES_PROVIDER_ID = `addresses_provider_${ MARKETPLACE_NAME }`;