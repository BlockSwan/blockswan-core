// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Ownable} from '../../dependencies/openzeppelin/contracts/Ownable.sol';
import {l_errors} from '../libraries/helpers/l_errors.sol';
import {i_provider_registry} from '../../interfaces/i_provider_registry.sol';

/**
 * @title c_provider_registry
 * @author Blockswan
 * @notice Main registry of protocol_addresses_provider of Blockswan marketplaces.
 * @dev Used for indexing purposes of Blockswan protocol's marketplaces. The id assigned to a protocol_addresses_provider refers to the
 * market it is connected with, for example with `1` for the Blockswan main market and `2` for the next created.
 **/
contract	c_provider_registry	is 	Ownable, i_provider_registry
{
	// Map of address provider ids (addresses_provider => id)
	mapping(address => uint256) private _addresses_provider_to_id;
	// Map of id to address provider (id => addresses_provider)
	mapping(uint256 => address) private _id_to_addresses_provider;
	// List of addresses providers
	address[] private _addresses_providers_list;
	// Map of address provider list indexes (addresses_provider => index_in_list)
	mapping(address => uint256) private _addresses_providers_indexes;

	/**
	 * @dev Constructor.
	 * @param owner The owner address of this contract.
	*/
	constructor(address owner)
	{
		transferOwnership(owner);
	}

	/// @inheritdoc i_provider_registry
	function get_addresses_providers_list()
		external view override
			returns (address[] memory)
	{
		return _addresses_providers_list;
	}

	/// @inheritdoc i_provider_registry
	function register_addresses_provider(address provider, uint256 id)
		external override onlyOwner
	{
		require(id != 0, l_errors.INVALID_ADDRESSES_PROVIDER_ID);
		require(_id_to_addresses_provider[id] == address(0), l_errors.INVALID_ADDRESSES_PROVIDER_ID);
		require(_addresses_provider_to_id[provider] == 0, l_errors.ADDRESSES_PROVIDER_ALREADY_ADDED);

		_addresses_provider_to_id[provider] = id;
		_id_to_addresses_provider[id] = provider;

		_add_to_addresses_providers_list(provider);
		emit ev_addresses_provider_registered(provider, id);
	}

	/// @inheritdoc i_provider_registry
	function unregister_addresses_provider(address provider)
		external override onlyOwner
	{
		require(_addresses_provider_to_id[provider] != 0, l_errors.ADDRESSES_PROVIDER_NOT_REGISTERED);
		uint256 old_id = _addresses_provider_to_id[provider];
		_id_to_addresses_provider[old_id] = address(0);
		_addresses_provider_to_id[provider] = 0;

		_remove_from_addresses_providers_list(provider);

		emit ev_addresses_provider_unregistered(provider, old_id);
	}

	/// @inheritdoc i_provider_registry
	function get_addresses_provider_id_by_address(address addresses_provider)
		external view override
			returns (uint256)
	{
		return _addresses_provider_to_id[addresses_provider];
	}

	/// @inheritdoc i_provider_registry
	function get_addresses_provider_address_by_id(uint256 id)
		external view override
			returns (address)
	{
		return _id_to_addresses_provider[id];
	}

	/**
	 * @notice Adds the addresses provider address to the list.
	 * @param provider The address of the protocol_addresses_provider
	*/
	function _add_to_addresses_providers_list(address provider)
		internal
	{
		_addresses_providers_indexes[provider] = _addresses_providers_list.length;
		_addresses_providers_list.push(provider);
	}

	/**
	 * @notice Removes the addresses provider address from the list.
	 * @param provider The address of the protocol_addresses_provider
	 */
	function _remove_from_addresses_providers_list(address provider)
		internal
	{
		uint256 index = _addresses_providers_indexes[provider];

		_addresses_providers_indexes[provider] = 0;

		// Swap the index of the last addresses provider in the list with the index of the provider to remove
		uint256 last_index = _addresses_providers_list.length - 1;
		if (index < last_index) {
		address last_provider = _addresses_providers_list[last_index];
			_addresses_providers_list[index] = last_provider;
			_addresses_providers_indexes[last_provider] = index;
		}
		_addresses_providers_list.pop();
	}
}