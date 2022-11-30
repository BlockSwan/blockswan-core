// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Counters} from '../../dependencies/openzeppelin/contracts/Counters.sol';

import {l_data_types} from '../libraries/types/l_data_types.sol';
import {l_account_logic} from "../libraries/logics/l_account_logic.sol";


/**
 * @title c_account_storage
 * @author Blockswan
 * @notice Contract used as storage of the account contract.
 * @dev It defines the storage layout of the account contract.
 */
contract c_account_storage
{
	using l_account_logic for l_data_types.s_escrow;
	Counters.Counter internal _total_accounts;
	Counters.Counter internal _total_pub_keys;


	// Map of users and their data (account_id => s_account)
	mapping(uint256 => l_data_types.s_account) internal _accounts;

	// Map of the public key used and their associated account_id (address => user_id)
	mapping(address => uint256) internal _pub_keys;

}