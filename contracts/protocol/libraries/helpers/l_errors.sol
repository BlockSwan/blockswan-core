// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.10;

/**
 * @title l_errors library
 * @author Blockswan
 * @notice Defines the error messages emitted by the different contracts of the Blockswan protocol
 */
library	l_errors
{

	// REGISTRY
	string public constant	INVALID_ADDRESSES_PROVIDER_ID = '1'; // The addresses provider is not valid
	string public constant	ADDRESSES_PROVIDER_ALREADY_ADDED = '2'; // This addresses provider already exists
	string public constant	ADDRESSES_PROVIDER_NOT_REGISTERED = '3'; // 'This addresses provider is not registered'

	// ADDRESSSES PROVIDER
	string public constant	INVALID_ADDRESSES_PROVIDER = '2'; // 'The address of the addresses provider is invalid'

	//ACL_MANAGER
	string public constant	ACL_ADMIN_CANNOT_BE_ZERO = '4'; // The protocol_acl_admin can't be the zero address
	string public constant	CALLER_NOT_PROTOCOL_ADMIN = '5'; // The caller must have the protocol admin role



	// ACCOUNT
	string public constant	ADDRESS_ALREADY_LINKED_TO_ACCOUNT = '5'; // This address is already linked to an account.
	string public constant	ACCOUNT_ALREADY_CREATED = '6'; // This account has already been created.
	string public constant	INVALID_ACCOUNT_ID = '7'; // The account is not valid

	// GIG
	string public constant GIG_ALREADY_CREATED = '8'; // The id has already been used for this gig
	string public constant INVALID_GIG_ID = '8'; // The gig id is not valid.

	// ORDER
	string public constant ORDER_ALREADY_CREATED = '8'; // The id has already been used for an order
	string public constant INVALID_ORDER_ID = '8'; // The order id is not valid.


}