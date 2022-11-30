require('dotenv').config();

export const MARKETPLACE_NAME = process.env.MARKETPLACE_NAME;

export const COMMON_DEPLOY_PARAMS = {
	log: true,
	deterministicDeployment: false,
};