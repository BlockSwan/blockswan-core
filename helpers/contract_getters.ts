import { get_contract } from "./utilities/tx";
import hre from "hardhat";
import { ACCOUNT_IMPL_ID, ACL_MANAGER_ID, ADDRESSES_PROVIDER_ID } from "./deploy_ids";


export const get_acl_manager = async (address?: string) => get_contract("c_acl_manager", address || (await hre.deployments.get(ACL_MANAGER_ID)).address);
export const get_addresses_provider = async (address?: string) => get_contract("c_addresses_provider", address || (await hre.deployments.get(ADDRESSES_PROVIDER_ID)).address);
export const get_provider_registry = async (address?: string) => get_contract("c_provider_registry", address || (await hre.deployments.get("c_provider_registry")).address);
export const get_account = async (address?: string) => get_contract("c_account", address || (await hre.deployments.get(ACCOUNT_IMPL_ID)).address);
export const get_account_libraries = async () =>
{

	const account_logic_artifact = await hre.deployments.get("l_account_logic");
	return {
		l_account_logic: account_logic_artifact.address
	};
};

export const get_gig_libraries = async () =>
{

	const gig_logic_artifact = await hre.deployments.get("l_gig_logic");
	return {
		l_gig_logic: gig_logic_artifact.address
	};
};