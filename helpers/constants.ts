import { version } from "../package.json";


// ----------------
// MATH
// ----------------

import { BigNumber } from 'ethers';
import { parseEther, parseUnits } from 'ethers/lib/utils';



// ----------------
// PROTOCOL GLOBAL PARAMS
// ----------------

export const MOCK_USD_PRICE_IN_WEI = '5848466240000000';
export const USD_ADDRESS = '0x10F7Fc1F91Ba351f9C629c5947AD69bD03C05b96';


// ----------------
// DEPLOYMENTS 
// ----------------

export const CORE_VERSION = version;


// ----------------
// UTILS
// ----------------

export const TEST_SNAPSHOT_ID = '0x1';

export const ZERO_BYTES_32 = "0x0000000000000000000000000000000000000000000000000000000000000000";
export const PERCENTAGE_FACTOR = '10000';
export const HALF_PERCENTAGE = BigNumber.from(PERCENTAGE_FACTOR).div(2).toString();

export const ONE_ETH = parseUnits('1', 18);
export const ONE_USD = parseUnits('1', 6);

export const MAX_UINT_AMOUNT =
	'115792089237316195423570985008687907853269984665640564039457584007913129639935';

export const ONE_YEAR = '31536000';
export const ZERO_ADDRESS = '0x0000000000000000000000000000000000000000';
export const ONE_ADDRESS = '0x0000000000000000000000000000000000000001';
