/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import { Signer, utils, Contract, ContractFactory, Overrides } from "ethers";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import type { PromiseOrValue } from "../../../../common";
import type {
  L_errors,
  L_errorsInterface,
} from "../../../../protocol/libraries/helpers/L_errors";

const _abi = [
  {
    inputs: [],
    name: "ACCOUNT_ALREADY_CREATED",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "ACL_ADMIN_CANNOT_BE_ZERO",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "ADDRESSES_PROVIDER_ALREADY_ADDED",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "ADDRESSES_PROVIDER_NOT_REGISTERED",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "ADDRESS_ALREADY_LINKED_TO_ACCOUNT",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "CALLER_NOT_PROTOCOL_ADMIN",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "GIG_ALREADY_CREATED",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "INVALID_ACCOUNT_ID",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "INVALID_ADDRESSES_PROVIDER",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "INVALID_ADDRESSES_PROVIDER_ID",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "INVALID_GIG_ID",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
];

const _bytecode =
  "0x61025961003a600b82828239805160001a60731461002d57634e487b7160e01b600052600060045260246000fd5b30600052607381538281f3fe73000000000000000000000000000000000000000030146080604052600436106100b35760003560e01c8063a1c34f531161007b578063a1c34f531461014e578063bf0b31511461012e578063c183b85b1461016e578063d9655710146100b8578063e02f07ee1461018e578063fd1828ff146101ae57600080fd5b806309f66b38146100b857806314dcfbbc146100ee57806337930782146100ee57806360c3de801461010e57806380268c201461012e575b600080fd5b6100d8604051806040016040528060018152602001603560f81b81525081565b6040516100e591906101ce565b60405180910390f35b6100d8604051806040016040528060018152602001601960f91b81525081565b6100d8604051806040016040528060018152602001603160f81b81525081565b6100d8604051806040016040528060018152602001600760fb1b81525081565b6100d8604051806040016040528060018152602001601b60f91b81525081565b6100d8604051806040016040528060018152602001603760f81b81525081565b6100d8604051806040016040528060018152602001603360f81b81525081565b6100d8604051806040016040528060018152602001600d60fa1b81525081565b600060208083528351808285015260005b818110156101fb578581018301518582016040015282016101df565b8181111561020d576000604083870101525b50601f01601f191692909201604001939250505056fea26469706673582212207a8ca858db737df5c08be8bd847ede27279d99d78a3d8330fa8c9edc4d3c30ed64736f6c634300080a0033";

type L_errorsConstructorParams =
  | [signer?: Signer]
  | ConstructorParameters<typeof ContractFactory>;

const isSuperArgs = (
  xs: L_errorsConstructorParams
): xs is ConstructorParameters<typeof ContractFactory> => xs.length > 1;

export class L_errors__factory extends ContractFactory {
  constructor(...args: L_errorsConstructorParams) {
    if (isSuperArgs(args)) {
      super(...args);
    } else {
      super(_abi, _bytecode, args[0]);
    }
  }

  override deploy(
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): Promise<L_errors> {
    return super.deploy(overrides || {}) as Promise<L_errors>;
  }
  override getDeployTransaction(
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): TransactionRequest {
    return super.getDeployTransaction(overrides || {});
  }
  override attach(address: string): L_errors {
    return super.attach(address) as L_errors;
  }
  override connect(signer: Signer): L_errors__factory {
    return super.connect(signer) as L_errors__factory;
  }

  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): L_errorsInterface {
    return new utils.Interface(_abi) as L_errorsInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): L_errors {
    return new Contract(address, _abi, signerOrProvider) as L_errors;
  }
}
