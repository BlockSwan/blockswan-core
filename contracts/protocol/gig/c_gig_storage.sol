// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Counters} from '../../dependencies/openzeppelin/contracts/Counters.sol';

import {l_data_types} from '../libraries/types/l_data_types.sol';
import {l_account_logic} from "../libraries/logics/l_account_logic.sol";


/**
 * @title c_gig_storage
 * @author Blockswan
 * @notice Contract used as storage for the gig contract.
 * @dev It defines the storage layout of the gig contract.
 */
contract c_gig_storage
{
	//using l_account_logic for l_data_types.s_gig;

	Counters.Counter internal _total_gigs;

	// Map of gigs and their data (gig_id => s_gig)
	mapping(uint256 => l_data_types.s_gig) internal _gigs;
}