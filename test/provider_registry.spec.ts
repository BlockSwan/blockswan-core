
import { expect } from 'chai';
import { ONE_ADDRESS } from '../helpers/constants';
import { deployments, ethers } from 'hardhat';
import { en_protocol_errors } from '../helpers/type';
import { i_test_env, make_suite } from "./helpers/make_suite";
import { C_addresses_provider, C_provider_registry } from '../types';


describe("provider_registry", function ()
{
	const NEW_ADDRESSES_PROVIDER_ID_2 = 2;
	const NEW_ADDRESSES_PROVIDER_ID_3 = 3;
	const NEW_ADDRESSES_PROVIDER_ADDRESS = ONE_ADDRESS;

	const {
		INVALID_ADDRESSES_PROVIDER_ID,
		ADDRESSES_PROVIDER_NOT_REGISTERED,
		ADDRESSES_PROVIDER_ALREADY_ADDED,
	} = en_protocol_errors;
	let test_env = {} as i_test_env;
	let { registry, registry_owner, addresses_provider, deployer, users } = test_env;

	before(async () =>
	{
		test_env = await make_suite();
		registry = test_env.registry;
		addresses_provider = test_env.addresses_provider;
		registry_owner = test_env.registry_owner;
		users = test_env.users;
	})



	it('Checks the addresses provider is added to the registry', async () =>
	{

		const providers = await registry.get_addresses_providers_list();

		expect(providers?.length).to.be.equal(1, 'Invalid length of the addresses providers list');
		if (providers)
		{
			expect(providers[0]?.toString()).to.be.equal(
				addresses_provider?.address,
				'Invalid addresses provider added to the list'
			);
		}
	});
	it('Tries to register an addresses provider with id 0 (revert expected)', async () =>
	{
		//const { registry, deployer, registry_owner } = await make_suite();
		await expect(
			registry.connect(registry_owner).register_addresses_provider(NEW_ADDRESSES_PROVIDER_ADDRESS, '0')
		).to.be.revertedWith(INVALID_ADDRESSES_PROVIDER_ID);
	});

	it('Registers a mock addresses provider', async () =>
	{
		// const { registry, registry_owner } = await make_suite();

		const providers_before = await registry.get_addresses_providers_list();

		expect(
			await registry.connect(registry_owner).register_addresses_provider(
				NEW_ADDRESSES_PROVIDER_ADDRESS,
				NEW_ADDRESSES_PROVIDER_ID_2
			)
		)
			.to.emit(registry, 'ev_addresses_provider_registered')
			.withArgs(NEW_ADDRESSES_PROVIDER_ADDRESS, NEW_ADDRESSES_PROVIDER_ID_2);

		expect(await registry.get_addresses_provider_id_by_address(NEW_ADDRESSES_PROVIDER_ADDRESS)).to.be.eq(
			NEW_ADDRESSES_PROVIDER_ID_2
		);

		const providers_after = await registry.get_addresses_providers_list();
		expect(providers_after.length).to.be.equal(
			providers_before.length + 1,
			'Invalid length of the addresses providers list'
		);
		expect(providers_after[1].toString()).to.be.equal(
			NEW_ADDRESSES_PROVIDER_ADDRESS,
			'Invalid addresses provider added to the list'
		);
		expect(await registry.get_addresses_provider_address_by_id(NEW_ADDRESSES_PROVIDER_ID_2)).to.be.equal(
			NEW_ADDRESSES_PROVIDER_ADDRESS,
			'Invalid update of id mapping'
		);
	});

	it('Registers users[2] as another addresses provider', async () =>
	{

		// Simulating an addresses provider using the users[2] wallet address
		expect(await registry.connect(registry_owner).register_addresses_provider(users[2].address, NEW_ADDRESSES_PROVIDER_ID_3))
			.to.emit(registry, 'ev_addresses_provider_registered')
			.withArgs(users[2].address, NEW_ADDRESSES_PROVIDER_ID_3);

		const providers = await registry.get_addresses_providers_list();

		expect(providers.length).to.be.equal(
			NEW_ADDRESSES_PROVIDER_ID_3,
			'Invalid length of the addresses providers list'
		);
		expect(providers[2].toString()).to.be.equal(
			users[2].address,
			'Invalid addresses provider added to the list'
		);
	});

	it('Removes the mock addresses provider', async () =>
	{
		//	const { users, registry, addresses_provider, registry_owner } = await make_suite();

		const providers_before = await registry.get_addresses_providers_list();

		expect(
			await registry.get_addresses_provider_id_by_address(NEW_ADDRESSES_PROVIDER_ADDRESS)
		).to.be.equal(NEW_ADDRESSES_PROVIDER_ID_2);

		expect(await registry.connect(registry_owner).unregister_addresses_provider(NEW_ADDRESSES_PROVIDER_ADDRESS))
			.to.emit(registry, 'ev_addresses_provider_unregistered')
			.withArgs(NEW_ADDRESSES_PROVIDER_ADDRESS, NEW_ADDRESSES_PROVIDER_ID_2);

		const providers_after = await registry.get_addresses_providers_list();

		expect(providers_after.length).to.be.equal(
			providers_before.length - 1,
			'Invalid length of the addresses providers list'
		);
		expect(providers_after[0].toString()).to.be.equal(
			addresses_provider.address,
			'Invalid addresses provider added to the list'
		);
	});

	it('Tries to remove an already unregistered addresses_provider (revert expected)', async () =>
	{
		//	const { users, registry, registry_owner } = await make_suite();

		await expect(
			registry.connect(registry_owner).unregister_addresses_provider(NEW_ADDRESSES_PROVIDER_ADDRESS)
		).to.be.revertedWith(ADDRESSES_PROVIDER_NOT_REGISTERED);
	});

	it('Tries to add an already registered addresses_provider with a different id (revert expected)', async () =>
	{
		//	const { registry, addresses_provider, registry_owner } = await make_suite();

		const id = await registry.get_addresses_provider_id_by_address(addresses_provider.address);
		expect(id).not.to.be.eq(0);

		const providers_before = await registry.get_addresses_providers_list();

		await expect(
			registry.connect(registry_owner).register_addresses_provider(addresses_provider.address, NEW_ADDRESSES_PROVIDER_ID_2)
		).to.be.revertedWith(ADDRESSES_PROVIDER_ALREADY_ADDED);

		const providers_after = await registry.get_addresses_providers_list();

		expect(await registry.get_addresses_provider_id_by_address(addresses_provider.address)).to.be.eq(id);

		expect(providers_after.length).to.be.equal(
			providers_before.length,
			'Invalid length of the addresses providers list'
		);
		expect(providers_after[0].toString()).to.be.equal(
			addresses_provider.address,
			'Invalid addresses provider added to the list'
		);
	});

	it('Tries to add an addresses_provider with an already used id (revert expected)', async () =>
	{
		//	const { users, registry, addresses_provider, registry_owner } = await make_suite();

		const id = await registry.get_addresses_provider_id_by_address(addresses_provider.address);
		expect(id).not.to.be.eq(0);

		// Simulating an addresses provider using the users[5] wallet address
		await expect(registry.connect(registry_owner).register_addresses_provider(users[5].address, id)).to.be.revertedWith(
			en_protocol_errors.INVALID_ADDRESSES_PROVIDER_ID
		);

		const providers = await registry.get_addresses_providers_list();
		const id_map: any = {};

		for (let i = 0; i < providers.length; i++)
		{
			const id = (await registry.get_addresses_provider_id_by_address(providers[i])).toNumber();
			if (id > 0)
			{
				if (id_map[id] == undefined)
				{
					id_map[id] = true;
				} else
				{
					expect(false, 'Duplicate ids').to.be.true;
				}
			}
		}
	});

	it('Reregisters the mock addresses provider after it being removed', async () =>
	{
		//	const { registry, registry_owner } = await make_suite();

		const providers_before = await registry.get_addresses_providers_list();

		expect(
			await registry.connect(registry_owner).register_addresses_provider(
				NEW_ADDRESSES_PROVIDER_ADDRESS,
				NEW_ADDRESSES_PROVIDER_ID_2
			)
		)
			.to.emit(registry, 'AddressesProviderRegistered')
			.withArgs(NEW_ADDRESSES_PROVIDER_ADDRESS, NEW_ADDRESSES_PROVIDER_ID_2);

		expect(await registry.get_addresses_provider_id_by_address(NEW_ADDRESSES_PROVIDER_ADDRESS)).to.be.eq(
			NEW_ADDRESSES_PROVIDER_ID_2
		);

		const providers_after = await registry.get_addresses_providers_list();
		expect(providers_after.length).to.be.equal(
			providers_before.length + 1,
			'Invalid length of the addresses providers list'
		);
		expect(providers_after[providers_after.length - 1].toString()).to.be.equal(
			NEW_ADDRESSES_PROVIDER_ADDRESS,
			'Invalid addresses provider added to the list'
		);
		expect(await registry.get_addresses_provider_address_by_id(NEW_ADDRESSES_PROVIDER_ID_2)).to.be.equal(
			NEW_ADDRESSES_PROVIDER_ADDRESS,
			'Invalid update of id mapping'
		);
	});

	it('Removes the last addresses provider', async () =>
	{
		//	const { registry, addresses_provider, registry_owner } = await make_suite();

		const providers_before = await registry.get_addresses_providers_list();
		const provider_to_remove = providers_before[providers_before.length - 1];
		const provider_to_remove_id = await registry.get_addresses_provider_id_by_address(provider_to_remove);

		expect(await registry.connect(registry_owner).unregister_addresses_provider(provider_to_remove))
			.to.emit(registry, 'ev_addresses_provider_unregistered')
			.withArgs(provider_to_remove, provider_to_remove_id);

		const providers_after = await registry.get_addresses_providers_list();

		expect(providers_after.length).to.be.equal(
			providers_before.length - 1,
			'Invalid length of the addresses providers list'
		);
		expect(providers_after[0].toString()).to.be.equal(
			addresses_provider.address,
			'Invalid addresses provider added to the list'
		);
	});
});
