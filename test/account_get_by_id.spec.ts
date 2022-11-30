import { expect } from 'chai';
import { en_protocol_errors } from '../helpers/type';
import { i_test_env, make_suite } from './helpers/make_suite';



describe('Account: get_accounts_list', () =>
{
	let test_env = {} as i_test_env;
	let { users, account } = test_env;

	beforeEach(async () =>
	{
		test_env = await make_suite();
		account = test_env.account;
		users = test_env.users;
		await account.connect(users[0].signer).create_account();
		await account.connect(users[1].signer).create_account();

	})


	it("Check that 2 accounts are added", async () =>
	{
		let total_account = await account.get_accounts_count();
		let total_pub_keys = await account.get_pub_keys_count();
		expect(total_account).to.be.equal(total_pub_keys);
		expect(total_account).to.be.equal(2);
	})
	it("Tries to create a new account with an address already used (revert expected)", async () =>
	{
		await expect(
			account.connect(users[1].signer).create_account()
		).to.be.revertedWith(en_protocol_errors.ADDRESS_ALREADY_LINKED_TO_ACCOUNT);

	})



	it('User gets account by id & address', async () =>
	{

		// await account.create_account();

		const user0_account_id = await account.get_account_id_by_address(users[0].address);

		const user0_account_data = await account.get_account_by_id(user0_account_id);

		const user0_account_data_bis = await account.get_account_by_address(users[0].address);


		expect(user0_account_data).to.eql(user0_account_data_bis);
	});

	it('User calls `get_accounts_list`', async () =>
	{
		const total_accounts = await account.get_accounts_count();
		let list = await account.get_accounts_list();

		expect(total_accounts).to.be.eq(list?.length);
	});
});