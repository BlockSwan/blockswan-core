// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.10;

import {AccessControlEnumerable} from '../../dependencies/openzeppelin/contracts/AccessControlEnumerable.sol';
import {Strings} from '../../dependencies/openzeppelin/contracts/Strings.sol';
import {i_addresses_provider} from '../../interfaces/i_addresses_provider.sol';
import {i_acl_manager} from '../../interfaces/i_acl_manager.sol';
import {l_errors} from '../libraries/helpers/l_errors.sol';

/**
 * @title acl_manager
 * @author Blockswan
 * @notice Access Control List Manager. Main registry of system roles and permissions.
 */
contract	c_acl_manager	is	AccessControlEnumerable, i_acl_manager
{
	bytes32 public constant override	PROTOCOL_ADMIN_ROLE = keccak256('PROTOCOL_ADMIN');
	bytes32 public constant override	BUYER_ROLE = keccak256('BUYER');
	bytes32 public constant override	SELLER_ROLE = keccak256('SELLER');
	bytes32 public constant override	JUDGE_ROLE = keccak256('JUDGE');
	bytes32 public constant override	BLACKLIST_ROLE = keccak256('BLACKLIST_ROLE');
	bytes32 public constant override	WHITELIST_ROLE = keccak256('WHITELIST_ROLE');

	i_addresses_provider public immutable	ADDRESSES_PROVIDER;

  /**
   * @dev Constructor
   * @dev The ACL admin should be initialized at the addresses provider beforehand
   * @param provider The address of the c_protocol_addresses_provider
   */
  constructor(i_addresses_provider provider)
  {
    ADDRESSES_PROVIDER = provider;
    address acl_admin = provider.get_acl_admin();
    require(acl_admin != address(0), l_errors.ACL_ADMIN_CANNOT_BE_ZERO);
    _setupRole(DEFAULT_ADMIN_ROLE, acl_admin);
  }

/// @inheritdoc i_acl_manager
  function set_role_admin(bytes32 role, bytes32 admin_role)
    external
    override
    onlyRole(DEFAULT_ADMIN_ROLE)
  {
    _setRoleAdmin(role, admin_role);
  }

/// @inheritdoc i_acl_manager
  function add_protocol_admin(address admin) external override
  {
    grantRole(PROTOCOL_ADMIN_ROLE, admin);
  }

/// @inheritdoc i_acl_manager
   function remove_protocol_admin(address admin) external override
   {
     revokeRole(PROTOCOL_ADMIN_ROLE, admin);
   }

/// @inheritdoc i_acl_manager
   function is_protocol_admin(address admin) external view override returns (bool)
   {
     return hasRole(PROTOCOL_ADMIN_ROLE, admin);
   }

/// @inheritdoc i_acl_manager
	function	get_protocol_admin_count() external view override returns (uint256)
	{
		return getRoleMemberCount(PROTOCOL_ADMIN_ROLE);
	}

/// @inheritdoc i_acl_manager
	function	get_protocol_admin_member(uint256 index) external view override returns (address)
	{
		return getRoleMember(PROTOCOL_ADMIN_ROLE, index);
	}

/// @inheritdoc i_acl_manager
   function add_buyer(address buyer) external override
   {
     		grantRole(BUYER_ROLE, buyer);
   }

/// @inheritdoc i_acl_manager
   function remove_buyer(address buyer) external override
   {
     revokeRole(BUYER_ROLE, buyer);
   }

/// @inheritdoc i_acl_manager
   function is_buyer(address buyer) external view override returns (bool)
   {
     return hasRole(BUYER_ROLE, buyer);
   }

/// @inheritdoc i_acl_manager
	function	get_buyer_count() external view override returns (uint256)
	{
		return getRoleMemberCount(BUYER_ROLE);
	}

/// @inheritdoc i_acl_manager
	function	get_buyer_member(uint256 index) external view override returns (address)
	{
		return getRoleMember(BUYER_ROLE, index);
	}

/// @inheritdoc i_acl_manager
   function add_seller(address seller) external override
   {
     grantRole(SELLER_ROLE, seller);
   }

/// @inheritdoc i_acl_manager
   function remove_seller(address seller) external override
   {
     revokeRole(SELLER_ROLE, seller);
   }

/// @inheritdoc i_acl_manager
   function is_seller(address seller) external view override returns (bool)
   {
     return hasRole(SELLER_ROLE, seller);
   }

/// @inheritdoc i_acl_manager
	function	get_seller_count() external view override returns (uint256)
	{
		return getRoleMemberCount(SELLER_ROLE);
	}

/// @inheritdoc i_acl_manager
	function	get_seller_member(uint256 index) external view override returns (address)
	{
		return getRoleMember(SELLER_ROLE, index);
	}

/// @inheritdoc i_acl_manager
   function add_judge(address judge) external override
   {
     grantRole(JUDGE_ROLE, judge);
   }

/// @inheritdoc i_acl_manager
   function remove_judge(address judge) external override
   {
     revokeRole(JUDGE_ROLE, judge);
   }

/// @inheritdoc i_acl_manager
   function is_judge(address judge) external view override returns (bool)
   {
     return hasRole(JUDGE_ROLE, judge);
   }

/// @inheritdoc i_acl_manager
	function	get_judge_count() external view override returns (uint256)
	{
		return getRoleMemberCount(JUDGE_ROLE);
	}

/// @inheritdoc i_acl_manager
	function	get_judge_member(uint256 index) external view override returns (address)
	{
		return getRoleMember(JUDGE_ROLE, index);
	}

/// @inheritdoc i_acl_manager
   function add_blacklist(address blacklist) external override
   {
     grantRole(BLACKLIST_ROLE, blacklist);
   }

/// @inheritdoc i_acl_manager
   function remove_blacklist(address blacklist) external override
   {
     revokeRole(BLACKLIST_ROLE, blacklist);
   }

/// @inheritdoc i_acl_manager
   function is_blacklist(address blacklist) external view override returns (bool)
   {
     return hasRole(BLACKLIST_ROLE, blacklist);
   }

/// @inheritdoc i_acl_manager
	function	get_blacklist_count() external view override returns (uint256)
	{
		return getRoleMemberCount(BLACKLIST_ROLE);
	}

/// @inheritdoc i_acl_manager
	function	get_blacklist_member(uint256 index) external view override returns (address)
	{
		return getRoleMember(BLACKLIST_ROLE, index);
	}

/// @inheritdoc i_acl_manager
   function add_whitelist(address whitelist) external override
   {
     grantRole(WHITELIST_ROLE, whitelist);
   }

/// @inheritdoc i_acl_manager
   function remove_whitelist(address whitelist) external override
   {
     revokeRole(WHITELIST_ROLE, whitelist);
   }

/// @inheritdoc i_acl_manager
   function is_whitelist(address whitelist) external view override returns (bool)
   {
     return hasRole(WHITELIST_ROLE, whitelist);
   }

/// @inheritdoc i_acl_manager
	function	get_whitelist_count() external view override returns (uint256)
	{
		return getRoleMemberCount(WHITELIST_ROLE);
	}

	/// @inheritdoc i_acl_manager
	function	get_whitelist_member(uint256 index)
		external view override
			returns (address)
	{
		return getRoleMember(WHITELIST_ROLE, index);
	}

/// @inheritdoc i_acl_manager
// 	function 	get_escrow_role_name(uint256 escrow_id, uint256 actor_id) public view override returns (bytes32)
// 	{
// 		string memory	str_escrow_id = Strings.toString(escrow_id);
// 		string memory	str_actor_id = Strings.toString(actor_id);
// 		return keccak256(abi.encode("ESCROW-", str_escrow_id, str_actor_id));
// 	}

// /// @inheritdoc i_acl_manager
// 	function	add_user_escrow(uint256 escrow_id, uint256 actor_id, address user_id) external override
// 	{
// 		bytes32	escrow_role = get_escrow_role_name(escrow_id, actor_id);
// 		grantRole(escrow_role, user_id);
// 	}

	// /// @inheritdoc i_acl_manager
	// function	remove_user_escrow(uint256 escrow_id, uint256 actor_id, address user_id) external override
	// {
	// 	bytes32	escrow_role = get_escrow_role_name(escrow_id, actor_id);
	// 	revokeRole(escrow_role, user_id);
	// }

	// /// @inheritdoc i_acl_manager
	// function	is_user_escrow(uint256 escrow_id, uint256 actor_id, address user_id) external view override returns (bool)
	// {
	// 	bytes32	escrow_role = get_escrow_role_name(escrow_id, actor_id);
	// 	return hasRole(escrow_role, user_id);
	// }

// /// @inheritdoc i_acl_manager
// 	function	get_user_escrow_count(uint256 escrow_id) external view override returns (uint256)
// 	{
// 		bytes32	escrow_role = get_escrow_role_name(escrow_id, actor_id);
// 		return getRoleMemberCount(WHITELIST_ROLE);
// 	}

// /// @inheritdoc i_acl_manager
// 	function	get_whitelist_member(uint256 index) external view override returns (address)
// 	{
// 		return getRoleMember(WHITELIST_ROLE, index);
// 	}
}