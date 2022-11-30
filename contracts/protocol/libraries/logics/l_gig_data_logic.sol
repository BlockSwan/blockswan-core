// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Address} from "../../../dependencies/openzeppelin/contracts/Address.sol";

import {l_data_types} from "../types/l_data_types.sol";

/**
 * @title Gig Data logic library
 * @author Blockswan
 * @notice Implements the logic for Account specific functions
 */
library l_gig_data_logic
{
	using l_gig_data_logic for l_data_types.s_gig;

	// See `i_gig` for descriptions
	event ev_gig_data_updated(
		uint256	indexed	gig_id,
		l_data_types.s_gig	gig
	);

	/**
	 * @notice Initializes a gig
	 * @param s_gig The gig object
	 * @param seller_id The address of the seller_id
	 * @param metadata the ipfs hash of the gig_data
	 * @param s_packages the details linked to the gig.
	**/
	function init(
		l_data_types.s_gig storage s_gig,
		uint256 seller_id,
		string memory metadata,
		l_data_types.s_package[] memory s_packages 
	) internal
	{
		s_gig.is_init = true;
		s_gig.seller_id = seller_id;
		s_gig.metadata = metadata;
		for (uint8 i = 0; i < s_packages.length; i++) {
			s_gig.packages.push(s_packages[i]);
		}
	}
}