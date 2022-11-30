import hre, { ethers } from "hardhat";
//import { Promise } from "bluebird";

export const get_evm_signers = async () =>
{
	const ethers_signers = await hre.ethers.getSigners();
	return ethers_signers;
};

export const get_evm_signers_addresses = async () => await Promise.all((await get_evm_signers()).map((signer) => signer.getAddress()));
export const get_first_signer = async () => (await get_evm_signers())[0];

export const get_named_signers = async () =>
{
	let named_accounts = await hre.getNamedAccounts();
	let named_signers: any = {};
	Object.keys(named_accounts).forEach(async (key: any) => 
	{
		const signer = await ethers.getSigner(named_accounts[key])
		named_signers[key] = signer;
	});
	return named_signers;
}

export const get_unnamed_signers = async () =>
{
	let unnamed_accounts = await hre.getUnnamedAccounts();
	let unnamed_users = [];
	for (let user of unnamed_accounts)
	{
		let signer: any = await ethers.getSigner(user)
		unnamed_users.push({ signer: signer, address: user })
	}
	return unnamed_users;
}
