// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Address} from "../../../dependencies/openzeppelin/contracts/Address.sol";

import {l_data_types} from "../types/l_data_types.sol";

/**
 * @title Account Data logic library
 * @author Blockswan
 * @notice Implements the logic for Account specific functions
 */
library l_account_data_logic
{
	using l_account_data_logic for l_data_types.s_account;

	// See `i_account` for descriptions
	event ev_account_data_updated(
		uint256	indexed	account_id,
		l_data_types.s_account	account
	);

	/**
	 * @notice Initializes an account.
	 * @param account The account object
	 * @param pub_key The address of the account
	 * @param metadata the ipfs hash of the account_data
	**/
	function init(
		l_data_types.s_account storage account,
		address pub_key,
		string memory metadata
	) internal
	{
		account.pub_keys.push(pub_key);
		account.metadata = metadata;
		account.is_init = true;
	}

}