// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Address} from "../../../dependencies/openzeppelin/contracts/Address.sol";

import {l_input_types} from "../types/l_input_types.sol";
import {l_data_types} from "../types/l_data_types.sol";
import {l_order_data_logic} from "./l_order_data_logic.sol";
import {l_errors} from "../helpers/l_errors.sol";

/**
 * @title Order logic library
 * @author Blockswan
 * @notice Implements the logic for order specific functions
 */
library l_order_logic
{
	using l_order_data_logic for l_data_types.s_order;


	// See `i_order` for descriptions
	event ev_order_added(uint256 indexed order_id, l_data_types.s_order s_order );
	event ev_order_edited(uint256 indexed order_id, l_data_types.s_order s_order);

	function execute_create_order(
		mapping(uint256 => l_data_types.s_gig) storage gigs,
		l_input_types.s_create_gig_params calldata params
	) external returns (bool) {
		require(!gigs[params.id].is_init, l_errors.GIG_ALREADY_CREATED);

		gigs[params.id].init(
			params.seller_id,
			params.metadata,
			params.packages
		);
		return true;
	}
}

		// l_data_types.s_gig storage gig,
		// uint256 seller_id,
		// string memory metadata,
		// l_data_types.s_package[] memory packages