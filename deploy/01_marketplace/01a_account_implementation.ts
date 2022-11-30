import { COMMON_DEPLOY_PARAMS, MARKETPLACE_NAME } from '../../helpers/envs';
import { DeployFunction } from 'hardhat-deploy/types'
import { HardhatRuntimeEnvironment } from 'hardhat/types'
import { ACCOUNT_IMPL_ID, ADDRESSES_PROVIDER_ID } from '../../helpers/deploy_ids';
import { get_account_libraries } from '../../helpers/contract_getters';


const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment)
{
	const { getNamedAccounts, deployments } = hre;
	const { deploy } = deployments;
	const { deployer } = await getNamedAccounts();

	const { address: addresses_provider_address } = await deployments.get(ADDRESSES_PROVIDER_ID);
	console.log(addresses_provider_address);

	const account_libraries = await get_account_libraries();
	// Deploy account contract
	await deploy(ACCOUNT_IMPL_ID, {
		contract: "c_account",
		from: deployer,
		args: [addresses_provider_address],
		libraries: {
			...account_libraries,
		},
		...COMMON_DEPLOY_PARAMS,
	});
}
func.id = "account_implementation";
func.tags = ["marketplace"];
export default func
