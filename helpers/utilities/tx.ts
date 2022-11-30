import hre from "hardhat";
//import { utils } from 'ethers'

import { t_evm_address } from "../type";



export const wait_for_tx = async (tx: any) => await tx.wait(1);

// export const evm_snapshot = async () => await hre.ethers.provider.send("evm_snapshot", []);

// export const evm_revert = async (id: any) => hre.ethers.provider.send("evm_revert", [id]);

export const get_contract = async (id: any, address?: t_evm_address) =>
{
	const artifact = await hre.deployments.getArtifact(id);
	return hre.ethers.getContractAt(artifact.abi, address || (await (await hre.deployments.get(id)).address));
};