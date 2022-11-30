/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Signer, utils } from "ethers";
import type { Provider } from "@ethersproject/providers";
import type { I_gig, I_gigInterface } from "../../interfaces/I_gig";

const _abi = [
  {
    inputs: [],
    name: "ADDRESSES_PROVIDER",
    outputs: [
      {
        internalType: "contract i_addresses_provider",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        components: [
          {
            internalType: "uint256",
            name: "price",
            type: "uint256",
          },
          {
            internalType: "uint256",
            name: "time_required",
            type: "uint256",
          },
          {
            internalType: "string",
            name: "metadata",
            type: "string",
          },
        ],
        internalType: "struct l_data_types.s_package[]",
        name: "packages",
        type: "tuple[]",
      },
    ],
    name: "create_gig",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "gig_id",
        type: "uint256",
      },
    ],
    name: "get_gig_by_id",
    outputs: [
      {
        components: [
          {
            internalType: "bool",
            name: "is_init",
            type: "bool",
          },
          {
            internalType: "uint256",
            name: "seller_id",
            type: "uint256",
          },
          {
            internalType: "string",
            name: "metadata",
            type: "string",
          },
          {
            components: [
              {
                internalType: "uint256",
                name: "price",
                type: "uint256",
              },
              {
                internalType: "uint256",
                name: "time_required",
                type: "uint256",
              },
              {
                internalType: "string",
                name: "metadata",
                type: "string",
              },
            ],
            internalType: "struct l_data_types.s_package[]",
            name: "packages",
            type: "tuple[]",
          },
        ],
        internalType: "struct l_data_types.s_gig",
        name: "",
        type: "tuple",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "get_gigs_count",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "get_gigs_list",
    outputs: [
      {
        components: [
          {
            internalType: "bool",
            name: "is_init",
            type: "bool",
          },
          {
            internalType: "uint256",
            name: "seller_id",
            type: "uint256",
          },
          {
            internalType: "string",
            name: "metadata",
            type: "string",
          },
          {
            components: [
              {
                internalType: "uint256",
                name: "price",
                type: "uint256",
              },
              {
                internalType: "uint256",
                name: "time_required",
                type: "uint256",
              },
              {
                internalType: "string",
                name: "metadata",
                type: "string",
              },
            ],
            internalType: "struct l_data_types.s_package[]",
            name: "packages",
            type: "tuple[]",
          },
        ],
        internalType: "struct l_data_types.s_gig[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
];

export class I_gig__factory {
  static readonly abi = _abi;
  static createInterface(): I_gigInterface {
    return new utils.Interface(_abi) as I_gigInterface;
  }
  static connect(address: string, signerOrProvider: Signer | Provider): I_gig {
    return new Contract(address, _abi, signerOrProvider) as I_gig;
  }
}