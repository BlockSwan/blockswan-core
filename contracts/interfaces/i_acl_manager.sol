// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {i_addresses_provider} from './i_addresses_provider.sol';

/**
 * @title i_acl_manager
 * @author Blockswan
 * @notice Defines the basic interface for the c_acl_manager
 **/
interface	i_acl_manager
{
	/**
	 * @notice Returns the contract address of the i_addresses_provider
	 * @return The address of the protocol_addresses_provider
	 */
	function ADDRESSES_PROVIDER() external view returns (i_addresses_provider);

	/**
	 * @notice Returns the identifier of the protocol_admin role
	 * @return The id of the protocol_admin role
	 */
	function PROTOCOL_ADMIN_ROLE() external view returns (bytes32);

	/**
	 * @notice Returns the identifier of the buyer role
	 * @return The id of the buyer role
	 */
	function BUYER_ROLE() external view returns (bytes32);

	/**
	 * @notice Returns the identifier of the seller role
	 * @return The id of the seller role
	 */
	function SELLER_ROLE() external view returns (bytes32);

	/**
	 * @notice Returns the identifier of the judge role
	 * @return The id of the judge role
	 */
	function JUDGE_ROLE() external view returns (bytes32);

	/**
	 * @notice Returns the identifier of the Blacklist role
	 * @return The id of the Blacklist role
	 */
	function BLACKLIST_ROLE() external view returns (bytes32);

	/**
	 * @notice Returns the identifier of the whitelist role
	 * @return The id of the whitelist role
	 */
	function WHITELIST_ROLE() external view returns (bytes32);


	/**
	 * @notice Set the role as admin of a specific role.
	 * @dev By default the admin role for all roles is `DEFAULT_ADMIN_ROLE`.
	 * @param role The role to be managed by the admin role
	 * @param admin_role The admin role
	 */
	function set_role_admin(bytes32 role, bytes32 admin_role) external;

	/**
	 * @notice Adds a new admin as protocol_admin
	 * @param admin The address of the new admin
	 */
	function add_protocol_admin(address admin) external;

	/**
	 * @notice Removes an admin as protocol_admin
	 * @param admin The address of the admin to remove
	 */
	function remove_protocol_admin(address admin) external;

	/**
	 * @notice Returns true if the address is protocol_admin, false otherwise
	 * @param admin The address to check
	 * @return True if the given address is protocol_admin, false otherwise
	 */
	function is_protocol_admin(address admin) external view returns (bool);

	/**
	 * @notice Returns the number of protocol_admin
	 */
	function get_protocol_admin_count() external view returns (uint256);

		/**
		* @notice Returns address for a protocol_admin index
		*/
	function get_protocol_admin_member(uint256 index) external view returns (address);


	/**
	 * @notice Adds a new user as buyer
	 * @param buyer The address of the new buyer
	 */
	function add_buyer(address buyer) external;

	/**
	 * @notice Removes an admin as buyer
	 * @param buyer The address of the buyer to remove
	 */
	function remove_buyer(address buyer) external;

	/**
	 * @notice Returns true if the address is buyer, false otherwise
	 * @param buyer The address to check
	 * @return True if the given address is buyer, false otherwise
	 */
	function is_buyer(address buyer) external view returns (bool);

	/**
	 * @notice Returns the number of buyer
	 */
	function get_buyer_count() external view returns (uint256);

		/**
		* @notice Returns the address of a buyer index
	*/
	function get_buyer_member(uint256 index) external view returns (address);

	/**
	 * @notice Adds a new user as seller
	 * @param seller The address of the new seller
	 */
	function add_seller(address seller) external;

	/**
	 * @notice Removes an user as seller
	 * @param seller The address of the seller to remove
	 */
	function remove_seller(address seller) external;

	/**
	 * @notice Returns true if the address is seller, false otherwise
	 * @param seller The address to check
	 * @return True if the given address is seller, false otherwise
	 */
	function is_seller(address seller) external view returns (bool);

	/**
	 * @notice Returns the number of seller
	 */
	function get_seller_count() external view returns (uint256);

		/**
		* @notice Returns the address of a seller index
	*/
	function get_seller_member(uint256 index) external view returns (address);

	/**
	 * @notice Adds a new address as judgee
	 * @param judge The address of the new judge
	 */
	function add_judge(address judge) external;

	/**
	 * @notice Removes an user as judge
	 * @param judge The address of the judge to remove
	 */
	function remove_judge(address judge) external;

	/**
	 * @notice Returns true if the address is judge, false otherwise
	 * @param judge The address to check
	 * @return True if the given address is judge, false otherwise
	 */
	function is_judge(address judge) external view returns (bool);

		/**
	 * @notice Returns the number of judge
	 */
	function get_judge_count() external view returns (uint256);

		/**
		* @notice Returns the address of a judge index
	*/
	function get_judge_member(uint256 index) external view returns (address);


	/**
	 * @notice Adds a new address as blacklist
	 * @param blacklist The address of the new blacklist
	 */
	function add_blacklist(address blacklist) external;

	/**
	 * @notice Removes an address as blacklist
	 * @param blacklist The address of the blacklist to remove
	 */
	function remove_blacklist(address blacklist) external;

	/**
	 * @notice Returns true if the address is blacklist, false otherwise
	 * @param blacklist The address to check
	 * @return True if the given address is blacklist, false otherwise
	 */
	function is_blacklist(address blacklist) external view returns (bool);

		/**
	 * @notice Returns the number of blacklist
	 */
	function get_blacklist_count() external view returns (uint256);

		/**
		* @notice Returns the address of a blacklist index
	*/
	function get_blacklist_member(uint256 index) external view returns (address);


	/**
	 * @notice Adds a new admin as whitelist
	 * @param whitelist The address of the new whitelist
	 */
	function add_whitelist(address whitelist) external;

	/**
	 * @notice Removes an admin as whitelist
	 * @param whitelist The address of the whitelist to remove
	 */
	function remove_whitelist(address whitelist) external;

	/**
	 * @notice Returns true if the address is whitelist, false otherwise
	 * @param whitelist The address to check
	 * @return True if the given address is whitelist, false otherwise
	 */
	function is_whitelist(address whitelist) external view returns (bool);

		/**
	 * @notice Returns the number of whitelist
	 */
	function get_whitelist_count() external view returns (uint256);

		/**
		* @notice Returns the address of a whitelist index
	*/
	function get_whitelist_member(uint256 index) external view returns (address);

		/**
	 * @notice Returns byte32 of the escrow role
	 * @param escrow_id The id of the escrow
	 * @param actor_id The id of the buyer/seller
	 * @return bytes32 of the escrow_buyer role
	 */
		// function 	get_escrow_role_name(uint256 escrow_id, uint256 actor_id) external view returns (bytes32);

		/**
	 * @notice Adds a new user as actor in the escrow
	 * @param escrow_id The escrow id
	 * @param actor_id The id of the buyer/seller defining the role in the escrow
	 * @param user_id The id of the user to give the role
	 */
		// function	add_user_escrow(uint256 escrow_id, uint256 actor_id, address user_id) external;

		/**
	 * @notice Removes an actor in the escrow
	 * @param escrow_id The escrow id
	 * @param actor_id The id of the buyer/seller defining the role in the escrow
	 * @param user_id The id of the user to remove the role
	 * @return True if user has the role
	 */
		//function	is_user_escrow(uint256 escrow_id, uint256 actor_id, address user_id) external view returns (bool);




}