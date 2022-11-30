// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {i_addresses_provider} from './i_addresses_provider.sol';
import {l_data_types} from '../protocol/libraries/types/l_data_types.sol';


/**
 * @title i_account
 * @author Blockswan
 * @notice Defines the basic interface for an blockswan account.
 **/
interface i_account
{
	/**
	 * @notice Returns the user account data.
	 * @param account_id The id of the account.
	 * @return s_account The data associated to the account it
	 **/
	function get_account_by_id(uint256 account_id)
		external view
			returns (l_data_types.s_account memory);

	/**
	 * @notice Returns the account_id for a given public key.
	 * @param pub_key The address as parameter.
	 * @return account_id the id of the account linked to the public key
	 **/
	function get_account_id_by_address(address pub_key)
		external view
			returns (uint256);

	/**
	 * @notice Returns the account for a given public key.
	 * @param pub_key The address as parameter.
	 * @return s_account the account linked to the public key
	 **/
	function get_account_by_address(address pub_key)
		external view
			returns (l_data_types.s_account memory);

	/**
	 * @notice Returns the list of all initialized accounts.
	 * @dev It does not include dropped accounts
	 * @return A data array of the underlying account.
	 **/
	function get_accounts_list()
		external view
			returns (l_data_types.s_account[] memory);

	/**
	 * @notice Returns the c_addresses_provider connected to this contract
	 * @return The address of the c_addresses_provider
	 **/
	function ADDRESSES_PROVIDER()
		external view
			returns (i_addresses_provider);

	/**
	 * @notice Returns the total number of account created
	 * @return the number of accounts
	 **/
	function get_accounts_count()
		external view
			returns (uint256);
	
	/**
	 * @notice Returns the total number of public keys linked to the marketplace
	 * @return the number of addresses
	 **/
	function get_pub_keys_count()
		external view
			returns (uint256);
	
	/**
	 * @notice Create a new accounts with the wallet caller
	 **/
	function	create_account() external;
}