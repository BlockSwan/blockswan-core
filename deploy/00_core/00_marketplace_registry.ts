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
	const provider_registry_artifact = await deploy(
		'c_provider_registry',
		{
			from: deployer,
			args: [deployer],
			...COMMON_DEPLOY_PARAMS,
		},
	)
	const registry_instance = await hre.ethers.getContractAt(
		provider_registry_artifact.abi,
		provider_registry_artifact.address,
	)
	await wait_for_tx(
		await registry_instance.transferOwnership(
			registry_owner,
		),
	)
	deployments.log(
		`[Deployment] Transferred ownership of c_provider_registry to: ${ registry_owner } `,
	)
	return true
}

func.id = 'c_provider_registry';
func.tags = ['core', 'registry'];
export default func