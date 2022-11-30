// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Address} from "../../../dependencies/openzeppelin/contracts/Address.sol";
import {IERC20} from "../../../dependencies/openzeppelin/contracts/IERC20.sol";

import {l_data_types} from "../types/l_data_types.sol";
import {l_input_types} from "../types/l_input_types.sol";
/**
 * @title l_order_data_logic
 * @author Blockswan
 * @notice Implements the logic for c_order specific functions
 */
library l_order_data_logic
{
	using l_order_data_logic for l_data_types.s_order;

	// See `i_order` for descriptions
	event ev_order_data_updated(
		uint256	indexed	order_id,
		l_data_types.s_order s_order
	);

	/**
	 * @notice Initializes an order
	 * @param s_order The order object 
	 * @param buyer_id The id of the buyer
	 * @param seller_id The id of the seller
	 * @param metadata The ipfs hash of the data
	 * @param s_milestones The array of s_milestones
	**/
	function init(
		l_data_types.s_order storage s_order,
		uint256	buyer_id,
		uint256	seller_id,
		string memory metadata,
		l_data_types.s_milestone[] memory s_milestones,
		IERC20	token
	) internal
	{
		s_order.is_init = true;
		s_order.init_timestamp = block.timestamp;
		s_order.buyer_ids.push(buyer_id);
		s_order.seller_ids.push(seller_id);
		s_order.metadata = metadata;
		s_order.token = token;
		s_order.s_milestones = s_milestones;
	}
}