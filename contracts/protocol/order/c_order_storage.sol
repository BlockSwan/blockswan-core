// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Counters} from "../../dependencies/openzeppelin/contracts/Counters.sol";

import {l_data_types} from '../libraries/types/l_data_types.sol';

/**
 * @title c_order_storage
 * @author Blockswan
 * @notice Contract used as storage of the order contract.
 * @dev It defines the storage layout of the order contract.
 */
contract c_order_storage
{
	using Counters for Counters.Counter;

	Counters.Counter internal _total_orders;

	// Map of escrows and their data (escrow_id => s_escrow)
	mapping(uint256 => l_data_types.s_order) internal _orders;

}