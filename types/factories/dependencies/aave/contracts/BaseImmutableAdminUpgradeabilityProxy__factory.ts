/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import { Signer, utils, Contract, ContractFactory, Overrides } from "ethers";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import type { PromiseOrValue } from "../../../../common";
import type {
  BaseImmutableAdminUpgradeabilityProxy,
  BaseImmutableAdminUpgradeabilityProxyInterface,
} from "../../../../dependencies/aave/contracts/BaseImmutableAdminUpgradeabilityProxy";

const _abi = [
  {
    inputs: [
      {
        internalType: "address",
        name: "admin",
        type: "address",
      },
    ],
    stateMutability: "nonpayable",
    type: "constructor",
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
  "0x60a060405234801561001057600080fd5b5060405161060738038061060783398101604081905261002f91610040565b6001600160a01b0316608052610070565b60006020828403121561005257600080fd5b81516001600160a01b038116811461006957600080fd5b9392505050565b6080516105596100ae600039600081816101070152818161014c01528181610205015281816102690152818161029201526102bf01526105596000f3fe60806040526004361061003f5760003560e01c80633659cfe6146100495780634f1ef286146100695780635c60da1b1461007c578063f851a440146100ad575b6100476100c2565b005b34801561005557600080fd5b5061004761006436600461046e565b6100fc565b610047610077366004610490565b610141565b34801561008857600080fd5b506100916101f8565b6040516001600160a01b03909116815260200160405180910390f35b3480156100b957600080fd5b5061009161025c565b6100ca6102b4565b6100fa6100f57f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc5490565b61034d565b565b336001600160a01b037f00000000000000000000000000000000000000000000000000000000000000001614156101395761013681610371565b50565b6101366100c2565b336001600160a01b037f00000000000000000000000000000000000000000000000000000000000000001614156101eb5761017b83610371565b6000836001600160a01b03168383604051610197929190610513565b600060405180830381855af49150503d80600081146101d2576040519150601f19603f3d011682016040523d82523d6000602084013e6101d7565b606091505b50509050806101e557600080fd5b50505050565b6101f36100c2565b505050565b6000336001600160a01b037f000000000000000000000000000000000000000000000000000000000000000016141561025157507f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc5490565b6102596100c2565b90565b6000336001600160a01b037f000000000000000000000000000000000000000000000000000000000000000016141561025157507f000000000000000000000000000000000000000000000000000000000000000090565b336001600160a01b037f00000000000000000000000000000000000000000000000000000000000000001614156100fa5760405162461bcd60e51b815260206004820152603260248201527f43616e6e6f742063616c6c2066616c6c6261636b2066756e6374696f6e20667260448201527137b6903a343290383937bc3c9030b236b4b760711b60648201526084015b60405180910390fd5b3660008037600080366000845af43d6000803e80801561036c573d6000f35b3d6000fd5b61037a816103b1565b6040516001600160a01b038216907fbc7cd75a20ee27fd9adebab32041f755214dbc6bffa90cc0225b39da2e5c2d3b90600090a250565b6001600160a01b0381163b61042e5760405162461bcd60e51b815260206004820152603b60248201527f43616e6e6f742073657420612070726f787920696d706c656d656e746174696f60448201527f6e20746f2061206e6f6e2d636f6e7472616374206164647265737300000000006064820152608401610344565b7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc55565b80356001600160a01b038116811461046957600080fd5b919050565b60006020828403121561048057600080fd5b61048982610452565b9392505050565b6000806000604084860312156104a557600080fd5b6104ae84610452565b9250602084013567ffffffffffffffff808211156104cb57600080fd5b818601915086601f8301126104df57600080fd5b8135818111156104ee57600080fd5b87602082850101111561050057600080fd5b6020830194508093505050509250925092565b818382376000910190815291905056fea26469706673582212209df9ecc268b54b073466b1783c421d1bc4446d24e613c4dc58ef78dc8a4ca01c64736f6c634300080a0033";

type BaseImmutableAdminUpgradeabilityProxyConstructorParams =
  | [signer?: Signer]
  | ConstructorParameters<typeof ContractFactory>;

const isSuperArgs = (
  xs: BaseImmutableAdminUpgradeabilityProxyConstructorParams
): xs is ConstructorParameters<typeof ContractFactory> => xs.length > 1;

export class BaseImmutableAdminUpgradeabilityProxy__factory extends ContractFactory {
  constructor(...args: BaseImmutableAdminUpgradeabilityProxyConstructorParams) {
    if (isSuperArgs(args)) {
      super(...args);
    } else {
      super(_abi, _bytecode, args[0]);
    }
  }

  override deploy(
    admin: PromiseOrValue<string>,
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): Promise<BaseImmutableAdminUpgradeabilityProxy> {
    return super.deploy(
      admin,
      overrides || {}
    ) as Promise<BaseImmutableAdminUpgradeabilityProxy>;
  }
  override getDeployTransaction(
    admin: PromiseOrValue<string>,
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): TransactionRequest {
    return super.getDeployTransaction(admin, overrides || {});
  }
  override attach(address: string): BaseImmutableAdminUpgradeabilityProxy {
    return super.attach(address) as BaseImmutableAdminUpgradeabilityProxy;
  }
  override connect(
    signer: Signer
  ): BaseImmutableAdminUpgradeabilityProxy__factory {
    return super.connect(
      signer
    ) as BaseImmutableAdminUpgradeabilityProxy__factory;
  }

  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): BaseImmutableAdminUpgradeabilityProxyInterface {
    return new utils.Interface(
      _abi
    ) as BaseImmutableAdminUpgradeabilityProxyInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): BaseImmutableAdminUpgradeabilityProxy {
    return new Contract(
      address,
      _abi,
      signerOrProvider
    ) as BaseImmutableAdminUpgradeabilityProxy;
  }
}
