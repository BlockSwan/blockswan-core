// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;


import {VersionedInitializable} from '../../dependencies/aave/contracts/VersionedInitializable.sol';
import {Counters} from '../../dependencies/openzeppelin/contracts/Counters.sol';
import {c_account_storage} from './c_account_storage.sol';
import {i_account} from "../../interfaces/i_account.sol";
import {i_addresses_provider} from "../../interfaces/i_addresses_provider.sol";
import {i_acl_manager} from "../../interfaces/i_acl_manager.sol";
import {l_account_logic} from "../libraries/logics/l_account_logic.sol";
import {l_errors} from "../libraries/helpers/l_errors.sol";
import {l_data_types} from "../libraries/types/l_data_types.sol";
import {l_input_types} from "../libraries/types/l_input_types.sol";

/**
 * @title	Account contract
 * @author	Blockswan
 * @notice  Accounts data within an Blockswan protocol's marketplace
 * - Users can:
 *   # login
 *   # edit profile
 *   # invite users
 *   # choose affiliates
 *   # get the access rights
 *   # claim their rewards
 * @dev To be covered by a proxy contract, owned by the addresses_provider of the specific marketplace
 * @dev All admin functions are callable by the protocol_configurator contract defined also in the
 *   addresses_provider
 **/
contract	c_account	is VersionedInitializable, c_account_storage, i_account
{
	using l_account_logic for l_data_types.s_account;


	uint256 public constant ACCOUNT_REVISION = 0x1;
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
		return ACCOUNT_REVISION;
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
	 * @notice Initializes the Account.
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

	/// @inheritdoc i_account
	function get_accounts_count()
		public view virtual override
			returns (uint256)
	{
		return Counters.current(_total_accounts);
	}

	/// @inheritdoc i_account
	function get_pub_keys_count()
		public view virtual override
			returns (uint256)
	{
		return Counters.current(_total_pub_keys);
	}


	/// @inheritdoc i_account
	function get_account_by_id(uint256 account_id)
		public view virtual override
		returns (l_data_types.s_account memory)
	{
		return _accounts[account_id];
	}

	/// @inheritdoc i_account
	function get_account_id_by_address(address pub_key)
		public view virtual override
			returns (uint256 account_id)
	{
		return _pub_keys[pub_key];
	}

	/// @inheritdoc i_account
	function get_account_by_address(address pub_key)
		external view virtual override
			returns (l_data_types.s_account memory)
	{
		uint256	account_id = get_account_id_by_address(pub_key);
		l_data_types.s_account memory account = get_account_by_id(account_id);
		return account;
	}

	/// @inheritdoc i_account
	function get_accounts_list()
		external view virtual override
			returns (l_data_types.s_account[] memory)
	{
		uint256 accounts_list_count = get_accounts_count();
		uint256 dropped_accounts_count = 0;
		l_data_types.s_account[] memory accounts_list = new l_data_types.s_account[](accounts_list_count);

		for (uint256 i = 1; i <= accounts_list_count; i++)
		{
			uint256	j = i - 1;
			if (_accounts[i].is_init) {
				accounts_list[j - dropped_accounts_count] = _accounts[i];
			} else {
				dropped_accounts_count++;
			}
		}
		// Reduces the length of the reserves array by `dropped_accounts_count`
		assembly {
			mstore(accounts_list, sub(accounts_list_count, dropped_accounts_count))
		}
		return accounts_list;
	}
	
	/// @inheritdoc i_account
	function	create_account()
		external  
	{
		uint256 current_total_account = Counters.current(_total_accounts);
		uint256	new_id = current_total_account + 1;
		Counters.increment(_total_accounts);
		Counters.increment(_total_pub_keys);
		bool is_created = l_account_logic.execute_create_account(
			_accounts,
			_pub_keys,
			l_input_types.s_create_account_params({
				pub_key: msg.sender,
				metadata: "test",
				id: new_id
			})
		);
		require(is_created && new_id == _total_accounts._value, l_errors.INVALID_ACCOUNT_ID);
	}

}