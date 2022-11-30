import { wait_for_tx } from "../../helpers/utilities/tx";
import { DeployFunction } from 'hardhat-deploy/types';
import { HardhatRuntimeEnvironment } from "hardhat/types";
import { ADDRESSES_PROVIDER_ID, ACL_MANAGER_ID } from "../../helpers/deploy_ids";
import { COMMON_DEPLOY_PARAMS, MARKETPLACE_NAME } from "../../helpers/envs";
import { ZERO_BYTES_32, CORE_VERSION } from "../../helpers/constants";
import { check_required_environment } from "../../helpers/marketplace_config_helpers";
const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment)
{

	const { getNamedAccounts, deployments } = hre;
	const { deploy } = deployments;
	const { deployer, protocol_admin, acl_admin } = await getNamedAccounts();
	const acl_admin_signer = await hre.ethers.getSigner(acl_admin);
	//	console.log(acl_admin, acl_admin_signer);

	const addresses_provider_artifact = await deployments.get(ADDRESSES_PROVIDER_ID);
	const addresses_provider_instance = (await hre.ethers.getContractAt(addresses_provider_artifact.abi, addresses_provider_artifact.address));
	// 1. Set ACL admin at addresses_provider
	await wait_for_tx(await addresses_provider_instance.set_acl_admin(acl_admin));
	// 2. Deploy acl_manager and setup administrators
	const acl_manager_artifact = await deploy(ACL_MANAGER_ID, {
		from: deployer,
		contract: "c_acl_manager",
		args: [addresses_provider_artifact.address],
		...COMMON_DEPLOY_PARAMS,
	});

	const acl_manager = await hre.ethers.getContractAt(acl_manager_artifact.abi, acl_manager_artifact.address);
	// 3. setup acl_manager at addresses_provider_instance
	await wait_for_tx(await addresses_provider_instance.set_acl_manager(acl_manager.address));
	// 4. Add protocol_admin to acl_manager contract
	await wait_for_tx(await acl_manager.connect(acl_admin_signer).add_protocol_admin(protocol_admin));
	// 5. TODO Add EmergencyAdmin  to ACLManager contract
	const is_acl_admin = await acl_manager.hasRole(ZERO_BYTES_32, acl_admin);
	const is_protocol_admin = await acl_manager.is_protocol_admin(protocol_admin);
	if (!is_acl_admin)
		throw "[ACL][ERROR] acl_admin is not setup correctly";
	if (!is_protocol_admin)
		throw "[ACL][ERROR] protocol_admin is not setup correctly";
	console.log("== Marketplace Admins ==");
	console.log("- acl_admin", acl_admin);
	console.log("- protocol_admin", protocol_admin);
	return true;

};

// This script can only be run successfully once per marketplace, core version, and network
func.id = `acl_manager:${ MARKETPLACE_NAME }:blockswan-core@${ CORE_VERSION }`;
func.tags = ["marketplace", "acl"];
func.dependencies = ["before_deploy", "core", "provider"];
func.skip = async () => check_required_environment();


export default func;




