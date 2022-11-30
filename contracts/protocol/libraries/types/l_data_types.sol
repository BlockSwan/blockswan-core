// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Counters} from "../../../dependencies/openzeppelin/contracts/Counters.sol";
import {IERC20} from '../../../dependencies/openzeppelin/contracts/IERC20.sol';
import {GPv2SafeERC20} from '../../../dependencies/gnosis/contracts/GPv2SafeERC20.sol';


library l_data_types
{
	using Counters for Counters.Counter;
	using GPv2SafeERC20 for IERC20;


	enum	e_escrow_state
	{
        UNCONFIRMED,
        CONFIRMED,
        TRIAL,
        PENDING,
        DONE
		// UPDATING
    }

	enum	e_protocol_state
	{
        RUNNING,
		PAUSED
    }

	struct	s_protocol_config
	{
		uint256				epoch_duration;
		uint8				max_vote_per_trial;
		e_protocol_state	e_state;
	}

	struct	s_delay_timestamp
	{
        uint32	self_refund;
        uint32	close_trial;
        uint32	end_trial;
	}

	struct	s_fee_flat
	{
		uint256	setup;
		uint256	epoch;
		uint256	trial;
		uint256	proceed;
	}

	struct	s_fee_percent
	{
		uint8	trial;
		uint8	proceed;
	}

	struct	s_milestone
	{
		uint256	price;
		uint256	start_timestamp;
		uint256	end_timestamp;
		uint256	bonus_price;
		bool	is_bonus;
	}

	struct s_package
	{
		uint256	price;
		uint256	time_required;
		string	metadata;
	}

	struct	s_user_fee
	{
		s_fee_flat		s_fee_flat;
		s_fee_percent	s_fee_percent;
	}

	struct s_max_fee
	{
		s_user_fee	s_buyer_fee;
		s_user_fee	s_seller_fee;
	}

	struct	s_retribution_percent
	{
		uint8	trust;
		uint8	judge;
		uint8	affiliate;
	}

	struct	s_grade
	{
		uint8	overall;
		uint8	communication;
		uint8	recommendation;
		uint8	description;
	}

	struct	s_comment
	{
		uint256				buyer_id;
		string				message;
		string				seller_answer;
		s_grade				s_grade;
		Counters.Counter	helpful;
		Counters.Counter	not_helpful;
	}

	struct	s_bid
	{
        uint256	id;
        uint256	offer_id;
        uint256	price;
        uint256	seller_id;
        string	metadata;
		bool	is_chosen;
	}

	struct	s_gig
	{
		bool				is_init;
		uint256 			seller_id;
        string				metadata;
		s_package[]			packages;
		//Counters.Counter	fail;
		//Counters.Counter	success;
    }

	struct	s_invoice
	{
        uint256 id;
        uint256 price;
        uint256	buyer_id;
        uint256	seller_id;
		uint256	timestamp;
        string	metadata;
		string	number;
    }

	struct	s_offer
	{
        uint256		id;
        uint256		buyer_id;
		uint256		bid_id;
        uint256[]	bids;
        string		metadata;
		bool		is_closed;
    }

	struct	s_user_timestamp
	{
		uint256	creation;
		uint256	buyer_epoch_end;
        uint256	seller_epoch_end;
	}

	struct	s_user_permission
	{
		bool	is_judge;
        bool	is_blacklist;
        bool	is_buyer;
        bool	is_seller;
        bool	is_admin;
	}

	struct	s_account
	{
		bool				is_init;
		uint256				inviter_id;
        uint256 			xp;
		address[]			pub_keys;
		uint256[2]			affiliates;
        string 				metadata;
		Counters.Counter	invite_buyer;
		Counters.Counter	invite_seller;
    }


	struct	s_order
	{	
		bool				is_init;
		uint256				init_timestamp;
		uint256[]			buyer_ids;
		uint256[]			seller_ids;
		string				metadata;
		string				_log;
		e_escrow_state		e_state;
		s_comment[]			s_comments;
		s_invoice			s_invoice;
		s_milestone[]		s_milestones;
		IERC20				token;

	}

	struct	s_init_account_params
	{
		address	pub_key;
		string	metadata;
		uint256	id;
	}
}
