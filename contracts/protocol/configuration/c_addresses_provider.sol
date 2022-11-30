// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "hardhat/console.sol";

import {Ownable} from '../../dependencies/openzeppelin/contracts/Ownable.sol';
import {i_addresses_provider} from "../../interfaces/i_addresses_provider.sol";
import {
	InitializableImmutableAdminUpgradeabilityProxy
	} from "../../dependencies/aave/contracts/InitializableImmutableAdminUpgradeabilityProxy.sol";

/**
 * @title i_addresses_provider.
 * @author Blockswan
 * @notice Main registry of addresses part of or connected to the protocol, including permissioned roles
 * @dev Acts as factory of proxies and admin of those, so with right to change its implementations
 * @dev Owned by the Blockswan Governance
 **/

contract	c_addresses_provider	is Ownable, i_addresses_provider
{

	// Identifier of the Blockswan MarketPlace
	string private	_marketplace_id;

	// Map of registered addresses (identifier => registeredAddress)
	mapping(bytes32 => address) private	_addresses;

	// Main identifiers
	bytes32 private constant	ESCROW = 'ESCROW';
	bytes32 private constant	GIG = 'GIG';
	bytes32 private constant	OFFER = 'OFFER';
	bytes32 private constant	USER = 'USER';
	bytes32 private constant	PROTOCOL_CONFIGURATOR = 'PROTOCOL_CONFIGURATOR';
	bytes32 private constant	PRICE_ORACLE = 'PRICE_ORACLE';
	bytes32 private constant	ACL_MANAGER = 'ACL_MANAGER';
	bytes32 private constant	ACL_ADMIN = 'ACL_ADMIN';
	bytes32 private constant	DATA_PROVIDER = 'DATA_PROVIDER';
	//bytes32 private constant	BID = 'BID';



	/**
	* @dev Constructor.
	* @param marketplace_id The identifier of the marketplace.
	* @param owner The owner address of this contract.
	*/constructor(string memory marketplace_id, address owner)
	{
		_set_marketplace_id(marketplace_id);
		transferOwnership(owner);
	}

	/// @inheritdoc i_addresses_provider
	function get_marketplace_id() external view override returns (string memory)
	{
		return _marketplace_id;
	}

	/// @inheritdoc i_addresses_provider
	function set_marketplace_id(string memory new_marketplace_id) external override onlyOwner
	{
		_set_marketplace_id(new_marketplace_id);
	}

	/// @inheritdoc i_addresses_provider
	function get_address(bytes32 id) public view override returns (address)
	{
		return _addresses[id];
	}

	/// @inheritdoc i_addresses_provider
	function set_address(bytes32 id, address new_address) external override onlyOwner
	{
		address old_address = _addresses[id];
		_addresses[id] = new_address;
		emit ev_address_set(id, old_address, new_address);
	}

	/// @inheritdoc i_addresses_provider
	function set_address_as_proxy(bytes32 id, address new_implementation_address)
		external
		override
		onlyOwner
	{
		address proxy_address = _addresses[id];
		address old_implementation_address = _get_proxy_implementation(id);
		_update_impl(id, new_implementation_address);
		emit ev_address_set_as_proxy(id, proxy_address, old_implementation_address, new_implementation_address);
	}

	/// @inheritdoc i_addresses_provider
	function get_escrow() external view override returns (address)
	{
		return get_address(ESCROW);
	}

	/// @inheritdoc i_addresses_provider
	function set_escrow_impl(address new_escrow_impl) external override onlyOwner
	{
		address old_escrow_impl = _get_proxy_implementation(ESCROW);
		_update_impl(ESCROW, new_escrow_impl);
		emit ev_escrow_updated(old_escrow_impl, new_escrow_impl);
	}

	/// @inheritdoc i_addresses_provider
	function get_offer() external view override returns (address)
	{
		return get_address(OFFER);
	}

	/// @inheritdoc i_addresses_provider
	function set_offer_impl(address new_offer_impl) external override onlyOwner
	{
		address old_offer_impl = _get_proxy_implementation(OFFER);
		_update_impl(OFFER, new_offer_impl);
		emit ev_offer_updated(old_offer_impl, new_offer_impl);
	}


	/// @inheritdoc i_addresses_provider
	function get_gig() external view override returns (address)
	{
		return get_address(GIG);
	}

	/// @inheritdoc i_addresses_provider
	function set_gig_impl(address new_gig_impl) external override onlyOwner
	{
		address old_gig_impl = _get_proxy_implementation(GIG);
		_update_impl(GIG, new_gig_impl);
		emit ev_gig_updated(old_gig_impl, new_gig_impl);
	}


	/// @inheritdoc i_addresses_provider
	function get_user() external view override returns (address)
	{
		return get_address(USER);
	}

	/// @inheritdoc i_addresses_provider
	function set_user_impl(address new_user_impl) external override onlyOwner
	{
		address old_user_impl = _get_proxy_implementation(USER);
		_update_impl(USER, new_user_impl);
		emit ev_user_updated(old_user_impl, new_user_impl);
	}


	/// @inheritdoc i_addresses_provider
	function get_protocol_configurator() external view override returns (address)
	{
		return get_address(PROTOCOL_CONFIGURATOR);
	}

	/// @inheritdoc i_addresses_provider
	function set_protocol_configurator_impl(address new_protocol_configurator_impl) external override onlyOwner
	{
		address old_pool_configurator_impl = _get_proxy_implementation(PROTOCOL_CONFIGURATOR);
		_update_impl(PROTOCOL_CONFIGURATOR, new_protocol_configurator_impl);
		emit ev_protocol_configurator_updated(old_pool_configurator_impl, new_protocol_configurator_impl);
	}

	/// @inheritdoc i_addresses_provider
	function get_price_oracle() external view override returns (address)
	{
		return get_address(PRICE_ORACLE);
	}

	/// @inheritdoc i_addresses_provider
	function set_price_oracle(address new_price_oracle) external override onlyOwner
	{
		address old_price_oracle = _addresses[PRICE_ORACLE];
		_addresses[PRICE_ORACLE] = new_price_oracle;
		emit ev_price_oracle_updated(old_price_oracle, new_price_oracle);
	}

	/// @inheritdoc i_addresses_provider
	function get_acl_manager() external view override returns (address)
	{
		return get_address(ACL_MANAGER);
	}

	/// @inheritdoc i_addresses_provider
		function set_acl_manager(address new_acl_manager) external override onlyOwner
		{
			address old_acl_manager = _addresses[ACL_MANAGER];
			_addresses[ACL_MANAGER] = new_acl_manager;
			emit ev_acl_manager_updated(old_acl_manager, new_acl_manager);
		}

	/// @inheritdoc i_addresses_provider
	function get_acl_admin() external view override returns (address)
	{
		return get_address(ACL_ADMIN);
	}

	/// @inheritdoc i_addresses_provider
	function set_acl_admin(address new_acl_admin) external override onlyOwner
	{
		address old_acl_admin = _addresses[ACL_ADMIN];
		_addresses[ACL_ADMIN] = new_acl_admin;
		emit ev_acl_admin_updated(old_acl_admin, new_acl_admin);
	}


	/// @inheritdoc i_addresses_provider
	function get_data_provider() external view override returns (address)
	{
		return get_address(DATA_PROVIDER);
	}

	/// @inheritdoc i_addresses_provider
	function set_data_provider(address new_data_provider) external override onlyOwner
	{
		address old_data_provider = _addresses[DATA_PROVIDER];
		_addresses[DATA_PROVIDER] = new_data_provider;
		emit ev_data_provider_updated(old_data_provider, new_data_provider);
	}

	/**
	 * @notice Internal function to update the implementation of a specific proxied component of the protocol.
	 * @dev If there is no proxy registered with the given identifier, it creates the proxy setting `new_address`
	 *   as implementation and calls the initialize() function on the proxy
	 * @dev If there is already a proxy registered, it just updates the implementation to `new_address` and
	 *   calls the initialize() function via upgradeToAndCall() in the proxy
	 * @param id The id of the proxy to be updated
	 * @param new_address The address of the new implementation
	 **/
	function	_update_impl(bytes32 id, address new_address) internal
	{
		address proxy_address = _addresses[id];
		InitializableImmutableAdminUpgradeabilityProxy proxy;
		bytes memory params = abi.encodeWithSignature('initialize(address)', address(this));

		if (proxy_address == address(0)) {
			proxy = new InitializableImmutableAdminUpgradeabilityProxy(address(this));
			_addresses[id] = proxy_address = address(proxy);
			proxy.initialize(new_address, params);
			emit ev_proxy_created(id, proxy_address, new_address);
		} else {
			proxy = InitializableImmutableAdminUpgradeabilityProxy(payable(proxy_address));
			proxy.upgradeToAndCall(new_address, params);
		}
	}

	/**
	 * @notice Updates the identifier of the Blockswan marketplace.
	 * @param new_marketplace_id The new id of the marketplace
	 **/
	function _set_marketplace_id(string memory new_marketplace_id) internal
	{
		string memory old_marketplace_id = _marketplace_id;
		_marketplace_id = new_marketplace_id;
		emit ev_marketplace_id_set(old_marketplace_id, new_marketplace_id);
	}

	/**
	 * @notice Returns the the implementation contract of the proxy contract by its identifier.
	 * @dev It returns ZERO if there is no registered address with the given id
	 * @dev It reverts if the registered address with the given id is not `InitializableImmutableAdminUpgradeabilityProxy`
	 * @param id The id
	 * @return The address of the implementation contract
	 */
	function _get_proxy_implementation(bytes32 id) internal returns (address) {
		address proxy_address = _addresses[id];
		if (proxy_address == address(0)) {
		return address(0);
		} else {
		address payable payable_proxy_address = payable(proxy_address);
		return InitializableImmutableAdminUpgradeabilityProxy(payable_proxy_address).implementation();
		}
	}
}