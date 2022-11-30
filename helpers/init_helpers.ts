import hre from "hardhat";
import { wait_for_tx } from "./utilities/tx";
import { is_valid_address } from "./utilities/utils";

export const add_marketplace_to_registry = async (provider_id: any, addresses_provider: any) =>
{
	const provider_registry = await hre.deployments.get("c_provider_registry");
	const provider_registry_instance = (await hre.ethers.getContractAt(provider_registry.abi, provider_registry.address));
	const provider_registry_owner = await provider_registry_instance.owner();
	if (!is_valid_address(addresses_provider))
	{
		throw Error('[add-marketplace-to-registry] Input parameter "addresses_provider" is missing or is not an address.');
	}
	const signer = await hre.ethers.getSigner(provider_registry_owner);
	// Set the provider at the Registry
	await wait_for_tx(await provider_registry_instance
		.connect(signer)
		.register_addresses_provider(addresses_provider, provider_id));
	console.log(`Added addresses_provider with address "${ addresses_provider }" to registry located at ${ provider_registry.address }`);
};