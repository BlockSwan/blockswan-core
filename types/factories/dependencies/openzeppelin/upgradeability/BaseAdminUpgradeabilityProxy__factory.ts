/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import { Signer, utils, Contract, ContractFactory, Overrides } from "ethers";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import type { PromiseOrValue } from "../../../../common";
import type {
  BaseAdminUpgradeabilityProxy,
  BaseAdminUpgradeabilityProxyInterface,
} from "../../../../dependencies/openzeppelin/upgradeability/BaseAdminUpgradeabilityProxy";

const _abi = [
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "address",
        name: "previousAdmin",
        type: "address",
      },
      {
        indexed: false,
        internalType: "address",
        name: "newAdmin",
        type: "address",
      },
    ],
    name: "AdminChanged",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: "address",
        name: "implementation",
        type: "address",
      },
    ],
    name: "Upgraded",
    type: "event",
  },
  {
    stateMutability: "payable",
    type: "fallback",
  },
  {
    inputs: [],
    name: "admin",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "newAdmin",
        type: "address",
      },
    ],
    name: "changeAdmin",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    name: "implementation",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "newImplementation",
        type: "address",
      },
    ],
    name: "upgradeTo",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "newImplementation",
        type: "address",
      },
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
    ],
    name: "upgradeToAndCall",
    outputs: [],
    stateMutability: "payable",
    type: "function",
  },
];

const _bytecode =
  "0x608060405234801561001057600080fd5b50610684806100206000396000f3fe60806040526004361061004a5760003560e01c80633659cfe6146100545780634f1ef286146100745780635c60da1b146100875780638f283970146100b8578063f851a440146100d8575b6100526100ed565b005b34801561006057600080fd5b5061005261006f366004610579565b610127565b61005261008236600461059b565b610164565b34801561009357600080fd5b5061009c610213565b6040516001600160a01b03909116815260200160405180910390f35b3480156100c457600080fd5b506100526100d3366004610579565b610275565b3480156100e457600080fd5b5061009c610387565b6100f56103cc565b6101256101207f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc5490565b610458565b565b60008051602061062f833981519152546001600160a01b0316336001600160a01b0316141561015c576101598161047c565b50565b6101596100ed565b60008051602061062f833981519152546001600160a01b0316336001600160a01b03161415610206576101968361047c565b6000836001600160a01b031683836040516101b292919061061e565b600060405180830381855af49150503d80600081146101ed576040519150601f19603f3d011682016040523d82523d6000602084013e6101f2565b606091505b505090508061020057600080fd5b50505050565b61020e6100ed565b505050565b600061022b60008051602061062f8339815191525490565b6001600160a01b0316336001600160a01b0316141561026a57507f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc5490565b6102726100ed565b90565b60008051602061062f833981519152546001600160a01b0316336001600160a01b0316141561015c576001600160a01b0381166103185760405162461bcd60e51b815260206004820152603660248201527f43616e6e6f74206368616e6765207468652061646d696e206f6620612070726f604482015275787920746f20746865207a65726f206164647265737360501b60648201526084015b60405180910390fd5b7f7e644d79422f17c01e4894b5f4f588d331ebfa28653d42ae832dc59e38c9798f61034f60008051602061062f8339815191525490565b604080516001600160a01b03928316815291841660208301520160405180910390a16101598160008051602061062f83398151915255565b600061039f60008051602061062f8339815191525490565b6001600160a01b0316336001600160a01b0316141561026a575060008051602061062f8339815191525490565b60008051602061062f833981519152546001600160a01b0316336001600160a01b031614156101255760405162461bcd60e51b815260206004820152603260248201527f43616e6e6f742063616c6c2066616c6c6261636b2066756e6374696f6e20667260448201527137b6903a343290383937bc3c9030b236b4b760711b606482015260840161030f565b3660008037600080366000845af43d6000803e808015610477573d6000f35b3d6000fd5b610485816104bc565b6040516001600160a01b038216907fbc7cd75a20ee27fd9adebab32041f755214dbc6bffa90cc0225b39da2e5c2d3b90600090a250565b6001600160a01b0381163b6105395760405162461bcd60e51b815260206004820152603b60248201527f43616e6e6f742073657420612070726f787920696d706c656d656e746174696f60448201527f6e20746f2061206e6f6e2d636f6e747261637420616464726573730000000000606482015260840161030f565b7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc55565b80356001600160a01b038116811461057457600080fd5b919050565b60006020828403121561058b57600080fd5b6105948261055d565b9392505050565b6000806000604084860312156105b057600080fd5b6105b98461055d565b9250602084013567ffffffffffffffff808211156105d657600080fd5b818601915086601f8301126105ea57600080fd5b8135818111156105f957600080fd5b87602082850101111561060b57600080fd5b6020830194508093505050509250925092565b818382376000910190815291905056feb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103a26469706673582212204f536471030c1f4fb0124d39ccc83ceceb68d2c0988f19b9188615ba93fb255f64736f6c634300080a0033";

type BaseAdminUpgradeabilityProxyConstructorParams =
  | [signer?: Signer]
  | ConstructorParameters<typeof ContractFactory>;

const isSuperArgs = (
  xs: BaseAdminUpgradeabilityProxyConstructorParams
): xs is ConstructorParameters<typeof ContractFactory> => xs.length > 1;

export class BaseAdminUpgradeabilityProxy__factory extends ContractFactory {
  constructor(...args: BaseAdminUpgradeabilityProxyConstructorParams) {
    if (isSuperArgs(args)) {
      super(...args);
    } else {
      super(_abi, _bytecode, args[0]);
    }
  }

  override deploy(
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): Promise<BaseAdminUpgradeabilityProxy> {
    return super.deploy(
      overrides || {}
    ) as Promise<BaseAdminUpgradeabilityProxy>;
  }
  override getDeployTransaction(
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): TransactionRequest {
    return super.getDeployTransaction(overrides || {});
  }
  override attach(address: string): BaseAdminUpgradeabilityProxy {
    return super.attach(address) as BaseAdminUpgradeabilityProxy;
  }
  override connect(signer: Signer): BaseAdminUpgradeabilityProxy__factory {
    return super.connect(signer) as BaseAdminUpgradeabilityProxy__factory;
  }

  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): BaseAdminUpgradeabilityProxyInterface {
    return new utils.Interface(_abi) as BaseAdminUpgradeabilityProxyInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): BaseAdminUpgradeabilityProxy {
    return new Contract(
      address,
      _abi,
      signerOrProvider
    ) as BaseAdminUpgradeabilityProxy;
  }
}