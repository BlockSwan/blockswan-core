import { COMMON_DEPLOY_PARAMS } from '../../helpers/envs';
import { wait_for_tx } from '../../helpers/utilities/tx'
import { DeployFunction } from 'hardhat-deploy/types'
import { HardhatRuntimeEnvironment } from 'hardhat/types'

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment)
{
	const { getNamedAccounts, deployments } = hre;
	const { deploy } = deployments;
	const {
		deployer,
		registry_owner,
	} = await getNamedAccounts()


	await deploy("l_account_logic", {
		from: deployer,
		...COMMON_DEPLOY_PARAMS,
	});

	await deploy("l_gig_logic", {
		from: deployer,
		...COMMON_DEPLOY_PARAMS,
	});

	return true;
}

func.id = "logic_libraries";
func.tags = ["core", "logic"];
export default func