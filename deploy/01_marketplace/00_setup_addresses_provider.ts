import { COMMON_DEPLOY_PARAMS, MARKETPLACE_NAME } from '../../helpers/envs';
import { wait_for_tx } from '../../helpers/utilities/tx'
import { DeployFunction } from 'hardhat-deploy/types'
import { HardhatRuntimeEnvironment } from 'hardhat/types'
import { ADDRESSES_PROVIDER_ID } from '../../helpers/deploy_ids';
import { add_marketplace_to_registry } from '../../helpers/init_helpers';
import { CORE_VERSION } from '../../helpers/constants';
import { check_required_environment } from '../../helpers/marketplace_config_helpers';


const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment)
{
	let marketplace_id = "10" // to be fetch by mocck impl.
	const { getNamedAccounts, deployments } = hre;
	const { deploy } = deployments;
	const { deployer } = await getNamedAccounts();

	// 1. Deploy c_protocol_addresses_provider
	// NOTE: The script passes 0 as marketplace id to create the same address of c_protocol_addresses_provider
	// in multiple networks via CREATE2. Later in this script it will update the corresponding Market ID.
	const addresses_provider_artifact = await deploy(ADDRESSES_PROVIDER_ID, {
		from: deployer,
		contract: "c_addresses_provider",
		args: ["0", deployer],
		...COMMON_DEPLOY_PARAMS,
	});

	const addresses_provider_instance = (await hre.ethers.getContractAt(addresses_provider_artifact.abi, addresses_provider_artifact.address));

	// 2. Set the marketplace_id 
	await wait_for_tx(await addresses_provider_instance.set_marketplace_id(marketplace_id));
	// 3. Add addresses_provider to Registry
	await add_marketplace_to_registry(marketplace_id, addresses_provider_artifact.address);
	// 4. Deploy ProtocolDataProvider getters contract
	// const protocolDataProvider = await deploy(deploy_ids_1.POOL_DATA_PROVIDER, {
	//     from: deployer,
	//     contract: "AaveProtocolDataProvider",
	//     args: [addressesProviderArtifact.address],
	//     ...env_1.COMMON_DEPLOY_PARAMS,
	// });
	// const currentProtocolDataProvider = await addressesProviderInstance.getPoolDataProvider();
	// // Set the ProtocolDataProvider if is not already set at addresses provider
	// if (!(0, utils_2.isEqualAddress)(protocolDataProvider.address, currentProtocolDataProvider)) {
	//     await (0, tx_1.waitForTx)(await addressesProviderInstance.setPoolDataProvider(protocolDataProvider.address));
	// }
	return true;
}

func.id = `c_addresses_provider:${ MARKETPLACE_NAME }:blockswan-core@${ CORE_VERSION }`;
func.tags = ["marketplace", "provider"];
func.dependencies = ["before_deploy", "core"]; // "periphery-pre", "token-setup"
func.skip = async () => check_required_environment();
export default func
