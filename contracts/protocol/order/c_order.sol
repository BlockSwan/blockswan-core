// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;


import {VersionedInitializable} from '../../dependencies/aave/contracts/VersionedInitializable.sol';
import {Counters} from '../../dependencies/openzeppelin/contracts/Counters.sol';

import {c_order_storage} from './c_order_storage.sol';
import {i_order} from "../../interfaces/i_gig.sol";
import {i_account} from "../../interfaces/i_account.sol";
import {i_addresses_provider} from "../../interfaces/i_addresses_provider.sol";
import {i_acl_manager} from "../../interfaces/i_acl_manager.sol";
import {l_gig_logic} from "../libraries/logics/l_gig_logic.sol";
import {l_errors} from "../libraries/helpers/l_errors.sol";
import {l_data_types} from "../libraries/types/l_data_types.sol";
import {l_input_types} from "../libraries/types/l_input_types.sol";

/**
 * @title	Gig contract
 * @author	Blockswan
 * @notice  Gig data within an Blockswan protocol's marketplace
 * - Users can:
 *   # create gigs
 *   # contract gigs
 *   # edit their gigs
 * @dev To be covered by a proxy contract, owned by the addresses_provider of the specific marketplace
 * @dev All admin functions are callable by the protocol_configurator contract defined also in the
 *   addresses_provider
 **/
contract	c_gig	is VersionedInitializable, c_gig_storage, i_gig
{
	using l_gig_logic for l_data_types.s_account;


	uint256 public constant GIG_REVISION = 0x1;
	i_addresses_provider public immutable ADDRESSES_PROVIDER;


	/**
	 * @dev Only protocol admin can call functions marked by this modifier.
	**/

	modifier only_protocol_admin()
	{
		_only_protocol_admin();
		_;
	}



	//modifier only_protocol_admin()
	function _only_protocol_admin()
		internal view virtual
	{
		require(
			i_acl_manager(ADDRESSES_PROVIDER.get_acl_manager()).is_protocol_admin(msg.sender),
			l_errors.CALLER_NOT_PROTOCOL_ADMIN
		);
	}


	function getRevision()
		internal pure virtual override
			returns (uint256)
	{
		return GIG_REVISION;
	}

	/**
	 * @dev Constructor.
	 * @param provider The address of the c_addresses_provider
	 */
	constructor(i_addresses_provider provider)
	{
		ADDRESSES_PROVIDER = provider;
	}

	/**
	 * @notice Initializes the gig.
	 * @dev Function is invoked by the proxy contract when the account contract is added to the
	 * addresses_provider of the marketplace.
	 * @dev Caching the address of the c_addresses_provider in order to reduce gas consumption on subsequent operations
	 * @param provider The address of the c_addresses_provider
	 **/
	function initialize(i_addresses_provider provider)
		external virtual initializer
	{
		require(provider == ADDRESSES_PROVIDER, l_errors.INVALID_ADDRESSES_PROVIDER);
	}

	/// @inheritdoc i_gig
	function get_gigs_count()
		public view virtual override
			returns (uint256)
	{
		return Counters.current(_total_gigs);
	}

	/// @inheritdoc i_gig
	function get_gig_by_id(uint256 gig_id)
		public view virtual override
		returns (l_data_types.s_gig memory)
	{
		return _gigs[gig_id];
	}


	/// @inheritdoc i_gig
	function get_gigs_list()
		external view virtual override
			returns (l_data_types.s_gig[] memory)
	{
		uint256 gigs_list_count = get_gigs_count();
		uint256 dropped_gigs_count = 0;
		l_data_types.s_gig[] memory gigs_list = new l_data_types.s_gig[](gigs_list_count);

		for (uint256 i = 0; i < gigs_list_count; i++)
		{
			if (_gigs[i].is_init) {
				gigs_list[i - dropped_gigs_count] = _gigs[i];
			} else {
				dropped_gigs_count++;
			}
		}
		// Reduces the length of the reserves array by `dropped_gigs_count`
		assembly {
			mstore(gigs_list, sub(gigs_list_count, dropped_gigs_count))
		}
		return gigs_list;
	}
	
	/// @inheritdoc i_gig
	function	create_order(uint)
		external  
	{

		//// TEST ////

		//////////////apply
		uint256 seller_id = i_account(ADDRESSES_PROVIDER.get_user()).get_account_id_by_address(msg.sender);
		uint256 current_total_gigs = Counters.current(_total_gigs);
		uint256	new_id = current_total_gigs + 1;
		bool is_created = l_gig_logic.execute_create_gig(
			_gigs,
			l_input_types.s_create_gig_params({
				id: new_id,
				seller_id: seller_id,
				metadata: "test",
				packages: packages
			})
		);
		Counters.increment(_total_orders);
		require(is_created && new_id == _total_orders._value, l_errors.INVALID_ORDER_ID);
	}

	function	accept_order() {}

	function	reject_order()	{}

	function	refund_buyer()	{}

	function	pay_seller()	{}

	function	raise_conflict()	{}

	function	go_next_milestone()	{}

	function	edit_milestones()	{}	

	function	add_fund()	{}

	function	edit_deadline()	{}		
}