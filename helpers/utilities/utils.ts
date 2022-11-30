import { utils } from "ethers";
import { ZERO_ADDRESS } from "../constants";

export const is_valid_address = (value: any) => !!value && utils.isAddress(value) && utils.getAddress(value) !== utils.getAddress(ZERO_ADDRESS);