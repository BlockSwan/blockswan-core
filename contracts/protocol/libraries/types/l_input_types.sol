// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Counters} from "../../../dependencies/openzeppelin/contracts/Counters.sol";
import {IERC20} from '../../../dependencies/openzeppelin/contracts/IERC20.sol';
import {GPv2SafeERC20} from '../../../dependencies/gnosis/contracts/GPv2SafeERC20.sol';

import {l_data_types} from './l_data_types.sol';


library l_input_types
{
	using Counters for Counters.Counter;
	using GPv2SafeERC20 for IERC20;


	struct	s_create_account_params
	{
		uint256	id;
		address	pub_key;
		string	metadata;
	}

	struct	s_create_gig_params
	{
		uint256						id;
		uint256						seller_id;
		string						metadata;
		l_data_types.s_package[]	packages;
	}

	struct	s_create_order_params
	{
		uint256						buyer_id;
		uint256						seller_id;
		string						metadata;
		l_data_types.s_milestone[]	s_milestones;
		IERC20						token;
	}
}
