export type t_evm_address = string;

export enum en_protocol_errors
{
	// REGISTRY
	INVALID_ADDRESSES_PROVIDER_ID = '1', // The addresses provider is not valid
	ADDRESSES_PROVIDER_ALREADY_ADDED = '2', // This addresses provider already exists
	ADDRESSES_PROVIDER_NOT_REGISTERED = '3', // 'This addresses provider is not registered'
	// ACL
	PROTOCOL_ACL_ADMIN_CANNOT_BE_ZERO = '1', // The protocol_acl_admin can't be the zero address
	// ACCOUNT
	ADDRESS_ALREADY_LINKED_TO_ACCOUNT = '5',// This address is already linked to an account.
	ACCOUNT_ALREADY_CREATED = '6',// This account has already been created.
	INVALID_ACCOUNT_ID = '7',// The account is not valid
}