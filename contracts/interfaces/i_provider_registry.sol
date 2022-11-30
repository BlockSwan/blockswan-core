// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/**
 * @title i_provider_registry
 * @author Blockswan
 * @notice Defines the basic interface for an Blockswan Protocol Provider Registry.
 **/
interface i_provider_registry
{
	/**
	 * @dev Emitted when a new addresses_provider is registered.
	 * @param addresses_provider The address of the registered protocol_addresses_provider
	 * @param id The id of the registered protocol_addresses_provider
	*/
	event ev_addresses_provider_registered(address indexed addresses_provider, uint256 indexed id);

	/**
	 * @dev Emitted when an addresses_provider is unregistered.
	 * @param addresses_provider The address of the unregistered protocol_addresses_provider
	 * @param id The id of the unregistered protocol_addresses_provider
	*/
	event ev_addresses_provider_unregistered(address indexed addresses_provider, uint256 indexed id);

	/**
	 * @notice Returns the list of registered addresses providers
	 * @return The list of addresses providers
	**/
	function get_addresses_providers_list() external view returns (address[] memory);

	/**
	 * @notice Returns the id of a registered protocol_addresses_provider
	 * @param addresses_provider The address of the protocol_addresses_provider
	 * @return The id of the protocol_addresses_provider or 0 if is not registered
	*/
	function get_addresses_provider_id_by_address(address addresses_provider)
		external
		view
		returns (uint256);

	/**
	 * @notice Returns the address of a registered protocol_addresses_provider
	 * @param id The id of the marketplace
	 * @return The address of the protocol_addresses_provider with the given id or zero address if it is not registered
	 */
	function get_addresses_provider_address_by_id(uint256 id) external view returns (address);

	/**
	 * @notice Registers an addresses provider
	 * @dev The protocol_addresses_provider must not already be registered in the registry
	 * @dev The id must not be used by an already registered protocol_addresses_provider
	 * @param provider The address of the new protocol_addresses_provider
	 * @param id The id for the new protocol_addresses_provider, referring to the marketplace it belongs to
	**/
	function register_addresses_provider(address provider, uint256 id) external;

	/**
	 * @notice Removes an addresses provider from the list of registered addresses providers
	 * @param provider The protocol_addresses_provider address
	**/
	function unregister_addresses_provider(address provider) external;
}