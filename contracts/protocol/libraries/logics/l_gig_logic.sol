// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Address} from "../../../dependencies/openzeppelin/contracts/Address.sol";

import {l_input_types} from "../types/l_input_types.sol";
import {l_data_types} from "../types/l_data_types.sol";
import {l_gig_data_logic} from "./l_gig_data_logic.sol";
import {l_errors} from "../helpers/l_errors.sol";

/**
 * @title Gig logic library
 * @author Blockswan
 * @notice Implements the logic for gig specific functions
 */
library l_gig_logic
{
	using l_gig_data_logic for l_data_types.s_gig;


	// See `i_user` for descriptions
	event ev_gig_added(uint256 indexed gig_id, l_data_types.s_gig gig );
	event ev_gig_edited(uint256 indexed gig_id, l_data_types.s_gig gig);

	function execute_create_gig(
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