// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Address} from "../../../dependencies/openzeppelin/contracts/Address.sol";

import {l_data_types} from "../types/l_data_types.sol";
import {l_account_data_logic} from "./l_account_data_logic.sol";
import {l_errors} from "../helpers/l_errors.sol";
import {l_input_types} from "../types/l_input_types.sol";

/**
 * @title Account logic library
 * @author Blockswan
 * @notice Implements the logic for user specific functions
 */
library l_account_logic
{
	using l_account_data_logic for l_data_types.s_account;


	// See `i_user` for descriptions
	event ev_account_added(uint256 indexed account_id, l_data_types.s_account account );
	event ev_account_edited(uint256 indexed account_id, l_data_types.s_account account);

	function execute_create_account(
		mapping(uint256 => l_data_types.s_account) storage accounts,
		mapping(address => uint256) storage pub_keys,
		l_input_types.s_create_account_params memory params
	) external returns (bool) {
		// add require !isContract
		require(pub_keys[params.pub_key] == 0, l_errors.ADDRESS_ALREADY_LINKED_TO_ACCOUNT);
		require(!accounts[params.id].is_init, l_errors.ACCOUNT_ALREADY_CREATED);

		accounts[params.id].init(
			params.pub_key,
			params.metadata
		);

		pub_keys[params.pub_key] = params.id;

		return true;
	}
}