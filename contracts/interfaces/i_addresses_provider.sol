// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/**
 * @title i_addresses_provider
 * @author Blockswan
 * @notice Defines the basic interface for an Addresses Provider.
**/

interface	i_addresses_provider
{

	/**
	 * @dev Emitted when the marketplace identifier is updated.
	 * @param old_marketplace_id The old id of the marketplace
	 * @param new_marketplace_id The new id of the marketplace
	*/
  	event ev_marketplace_id_set(string indexed old_marketplace_id, string indexed new_marketplace_id);

	/**
	 * @dev Emitted when the ACL manager is updated.
	 * @param old_address The old address of the c_acl_manager
	 * @param new_address The new address of the c_acl_manager
	 */
	event ev_acl_manager_updated(address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when the protocol ACL admin is updated.
	 * @param old_address The old address of the acl_admin
	 * @param new_address The new address of the acl_admin
	*/
	event ev_acl_admin_updated(address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when the  escrow is updated.
	 * @param old_address The old address of the escrow
	 * @param new_address The new address of the escrow
	*/
	event ev_escrow_updated(address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when the  gig is updated.
	 * @param old_address The old address of the gig
	 * @param new_address The new address of the gig
	*/
	event ev_gig_updated(address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when the  offer is updated.
	 * @param old_address The old address of the offer
	 * @param new_address The new address of the offer
	*/
	event ev_offer_updated(address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when the  offer is updated.
	 * @param old_address The old address of the user
	 * @param new_address The new address of the user
	*/
	event ev_user_updated(address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when the Protocol Configurator is updated.
	 * @param old_address The old address of the  c_protocol_configurator
	 * @param new_address The new address of the c_protocol_configurator
	 */
	event ev_protocol_configurator_updated(address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when the Price Oracle is updated.
	 * @param old_address The old address of the c_price_oracle
	 * @param new_address The new address of the c_price_oracle Oracle
	 */
	event ev_price_oracle_updated(address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when the  data provider is updated.
	 * @param old_address The old address of the c_data_provider
	 * @param new_address The new address of the c_data_provider
	 */
	event ev_data_provider_updated(address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when a new proxy is created.
	 * @param id The identifier of the proxy
	 * @param proxy_address The address of the created proxy contract
	 * @param implementation_address The address of the implementation contract
	 */
	event ev_proxy_created(
		bytes32 indexed id,
		address indexed proxy_address,
		address indexed implementation_address
	);

	/**
	 * @dev Emitted when a new non-proxied contract address is registered.
	 * @param id The identifier of the contract
	 * @param old_address The address of the old contract
	 * @param new_address The address of the new contract
	 */
	event ev_address_set(bytes32 indexed id, address indexed old_address, address indexed new_address);

	/**
	 * @dev Emitted when the implementation of the proxy registered with id is updated
	 * @param id The identifier of the contract
	 * @param proxy_address The address of the proxy contract
	 * @param old_implementation_address The address of the old implementation contract
	 * @param new_implementation_address The address of the new implementation contract
	 */
	event ev_address_set_as_proxy(
		bytes32 indexed id,
		address indexed proxy_address,
		address old_implementation_address,
		address indexed new_implementation_address
	);

	/**
	 * @notice Returns the id of the Blockswan marketplace to which this contract points to.
	 * @return The marketplace id
	 **/
	function get_marketplace_id() external view returns (string memory);

	/**
	 * @notice Associates an id with a specific c_addresses_provider.
	 * @dev This can be used to create an onchain registry of c_addresses_provider to
	 * identify and validate multiple Blockswan marketplace.
	 * @param new_marketplace_id The marketplace id
	 */
	function set_marketplace_id(string calldata new_marketplace_id) external;

	/**
	 * @notice Returns an address by its identifier.
	 * @dev The returned address might be an EOA or a contract, potentially proxied
	 * @dev It returns ZERO if there is no registered address with the given id
	 * @param id The id
	 * @return The address of the registered for the specified id
	 */
	function get_address(bytes32 id) external view returns (address);

	/**
	 * @notice General function to update the implementation of a proxy registered with
	 * certain `id`. If there is no proxy registered, it will instantiate one and
	 * set as implementation the `new_implementation_address`.
	 * @dev IMPORTANT Use this function carefully, only for ids that don't have an explicit
	 * setter function, in order to avoid unexpected consequences
	 * @param id The id
	 * @param new_implementation_address The address of the new implementation
	 */
	function set_address_as_proxy(bytes32 id, address new_implementation_address) external;

	/**
	 * @notice Sets an address for an id replacing the address saved in the addresses map.
	 * @dev IMPORTANT Use this function carefully, as it will do a hard replacement
	 * @param id The id
	 * @param new_address The address to set
	 */
	function set_address(bytes32 id, address new_address) external;

	/**
	 * @notice Returns the address of the escrow.
	 * @return The escrow  address
	 **/
	function get_escrow() external view returns (address);

	/**
	 * @notice Updates the implementation of the Escrow, or creates a proxy
	 * setting the new `Escorw` implementation when the function is called for the first time.
	 * @param new_escrow_impl The new proxy implementation
	 **/
	function set_escrow_impl(address new_escrow_impl) external;

		/**
	 * @notice Returns the address of the gig.
	 * @return The gif  address
	 **/
	function get_gig() external view returns (address);

	/**
	 * @notice Updates the implementation of the gig, or creates a proxy
	 * setting the new `gig` implementation when the function is called for the first time.
	 * @param new_gig_impl The new proxy implementation
	 **/
	function set_gig_impl(address new_gig_impl) external;

	/**
	 * @notice Returns the address of the offer.
	 * @return The offer  address
	 **/
	function get_offer() external view returns (address);

	/**
	 * @notice Updates the implementation of the offer, or creates a proxy
	 * setting the new `offer` implementation when the function is called for the first time.
	 * @param new_offer_impl The new proxy implementation
	 **/
	function set_offer_impl(address new_offer_impl) external;


	/**
	 * @notice Returns the address of the c_user.
	 * @return The c_user address
	**/
	function get_user() external view returns (address);

	/**
	 * @notice Updates the implementation of the c_user, or creates a proxy
	 * setting the new `c_user` implementation when the function is called for the first time.
	 * @param new_user_impl The new proxy implementation
	 **/
	function set_user_impl(address new_user_impl) external;

	/**
	 * @notice Returns the address of the c_protocol_configurator proxy.
	 * @return The c_protocol_configurator proxy address
	 **/
	function get_protocol_configurator() external view returns (address);

	/**
	 * @notice Updates the implementation of the c_protocol_configurator, or creates a proxy
	 * setting the new `c_protocol_configurator` implementation when the function is called for the first time.
	 * @param new_pool_configurator_impl The new PoolConfigurator implementation
	 **/
	function set_protocol_configurator_impl(address new_pool_configurator_impl) external;

	/**
	 * @notice Returns the address of the c_price_oracle.
	 * @return The address of the c_price_oracle
	 */
	function get_price_oracle() external view returns (address);

	/**
	 * @notice Updates the address of the c_price_oracle.
	 * @param new_price_oracle The address of the new c_new_price_oracle
	 */
	function set_price_oracle(address new_price_oracle) external;

	/**
	 * @notice Returns the address of the c_acl_manager.
	 * @return The address of the c_acl_manager
	 */
	function get_acl_manager() external view returns (address);

	/**
	 * @notice Updates the address of the c_acl_manager.
	 * @param new_acl_manager The address of the new c_acl_manager
	 **/
	function set_acl_manager(address new_acl_manager) external;

	/**
	 * @notice Returns the address of the ACL admin.
	 * @return The address of the ACL admin
	 */
	function get_acl_admin() external view returns (address);

	/**
	 * @notice Updates the address of the ACL admin.
	 * @param new_acl_admin The address of the new ACL admin
	 */
	function set_acl_admin(address new_acl_admin) external;

	/**
	 * @notice Returns the address of the data provider.
	 * @return The address of the c_data_provider
	 */
	function get_data_provider() external view returns (address);

	/**
	 * @notice Updates the address of the data provider.
	 * @param new_data_provider The address of the new data_provider
	 **/
	function set_data_provider(address new_data_provider) external;

}