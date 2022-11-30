require('dotenv').config();

export const check_required_environment = () =>
{
	if (!process.env.MARKETPLACE_NAME)
	{
		console.error(`Skipping Marketplace deployment due to missing "MARKETPLACE_NAME" environment variable.`);
		return true;
	}
	return false;
};