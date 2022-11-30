// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {i_addresses_provider} from './i_addresses_provider.sol';
import {l_data_types} from '../protocol/libraries/types/l_data_types.sol';


/**
 * @title i_gig
 * @author Blockswan
 * @notice Defines the basic interface for an blockswan gig.
 **/
interface i_gig
{
	/**
	 * @notice Returns the gig  data.
	 * @param gig_id The id of the gig.
	 * @return s_gig The data associated to the gig
	 **/
	function get_gig_by_id(uint256 gig_id)
		external view
			returns (l_data_types.s_gig memory);

	
	/**
	 * @notice Returns the list of all initialized gigs.
	 * @dev It does not include dropped accounts
	 * @return A data array of the underlying gigs.
	 **/
	function get_gigs_list()
		external view
			returns (l_data_types.s_gig[] memory);

	/**
	 * @notice Returns the c_addresses_provider connected to this contract
	 * @return The address of the c_addresses_provider
	 **/
	function ADDRESSES_PROVIDER()
		external view
			returns (i_addresses_provider);

	/**
	 * @notice Returns the total number of gigs created
	 * @return the number of gigs
	 **/
	function get_gigs_count()
		external view
			returns (uint256);

	
	/**
	 * @notice Create a new gig with the wallet caller
	 * @param packages the packages in the gig
	 **/
	function	create_gig(l_data_types.s_package[] memory packages) external;
}