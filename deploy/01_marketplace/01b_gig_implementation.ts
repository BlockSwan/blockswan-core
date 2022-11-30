import { COMMON_DEPLOY_PARAMS, MARKETPLACE_NAME } from '../../helpers/envs';
import { DeployFunction } from 'hardhat-deploy/types'
import { HardhatRuntimeEnvironment } from 'hardhat/types'
import { ADDRESSES_PROVIDER_ID, GIG_IMPL_ID } from '../../helpers/deploy_ids';
import { get_gig_libraries } from '../../helpers/contract_getters';


const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment)
{
	const { getNamedAccounts, deployments } = hre;
	const { deploy } = deployments;
	const { deployer } = await getNamedAccounts();

	const { address: addresses_provider_address } = await deployments.get(ADDRESSES_PROVIDER_ID);
	console.log(addresses_provider_address);

	const gig_libraries = await get_gig_libraries();
	// Deploy account contract
	await deploy(GIG_IMPL_ID, {
		contract: "c_gig",
		from: deployer,
		args: [addresses_provider_address],
		libraries: {
			...gig_libraries,
		},
		...COMMON_DEPLOY_PARAMS,
	});
}
func.id = "gig_implementation";
func.tags = ["marketplace"];
export default func
