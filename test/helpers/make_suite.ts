import { Signer } from 'ethers';
import { deployments } from 'hardhat';
import { get_account, get_acl_manager, get_addresses_provider, get_provider_registry } from '../../helpers/contract_getters';
import { ADDRESSES_PROVIDER_ID } from '../../helpers/deploy_ids';
import { t_evm_address } from "../../helpers/type";
import { get_evm_signers, get_named_signers, get_unnamed_signers } from '../../helpers/utilities/signers';
import { get_contract } from '../../helpers/utilities/tx';
import { C_account, C_acl_manager, C_addresses_provider, C_provider_registry } from '../../types';


export interface i_signer_with_address
{
	signer: Signer;
	address: t_evm_address;
}

export interface i_test_env
{
	// admins & users
	deployer: i_signer_with_address;
	registry_owner: Signer;
	acl_admin: Signer;
	protocol_admin: Signer;
	users: i_signer_with_address[];

	// contracts
	addresses_provider: C_addresses_provider;
	registry: C_provider_registry;
	acl_manager: C_acl_manager;
	account: C_account;
}


export const make_suite = deployments.createFixture(
	async ({ deployments, ethers }, _options) =>
	{

		await deployments.fixture(); // ensure a fresh deployments


		let named_signers = await get_named_signers();
		let unnamed_signers = await get_unnamed_signers();


		let test_env = {} as i_test_env;

		test_env.deployer = named_signers.deployer;
		test_env.registry_owner = named_signers.registry_owner as Signer;
		test_env.protocol_admin = named_signers.protocol_admin as Signer;
		test_env.acl_admin = named_signers.acl_admin as Signer;

		test_env.users = unnamed_signers;

		test_env.registry = await get_provider_registry() as C_provider_registry;
		test_env.addresses_provider = await get_addresses_provider() as C_addresses_provider;
		test_env.account = await get_account() as C_account;
		test_env.acl_manager = await get_acl_manager() as C_acl_manager;

		return test_env;
	}
);
