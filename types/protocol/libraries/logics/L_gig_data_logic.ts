/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import type {
  BaseContract,
  BigNumber,
  BigNumberish,
  Signer,
  utils,
} from "ethers";
import type { EventFragment } from "@ethersproject/abi";
import type { Listener, Provider } from "@ethersproject/providers";
import type {
  TypedEventFilter,
  TypedEvent,
  TypedListener,
  OnEvent,
  PromiseOrValue,
} from "../../../common";

export declare namespace L_data_types {
  export type S_packageStruct = {
    price: PromiseOrValue<BigNumberish>;
    time_required: PromiseOrValue<BigNumberish>;
    metadata: PromiseOrValue<string>;
  };

  export type S_packageStructOutput = [BigNumber, BigNumber, string] & {
    price: BigNumber;
    time_required: BigNumber;
    metadata: string;
  };

  export type S_gigStruct = {
    is_init: PromiseOrValue<boolean>;
    seller_id: PromiseOrValue<BigNumberish>;
    metadata: PromiseOrValue<string>;
    packages: L_data_types.S_packageStruct[];
  };

  export type S_gigStructOutput = [
    boolean,
    BigNumber,
    string,
    L_data_types.S_packageStructOutput[]
  ] & {
    is_init: boolean;
    seller_id: BigNumber;
    metadata: string;
    packages: L_data_types.S_packageStructOutput[];
  };
}

export interface L_gig_data_logicInterface extends utils.Interface {
  functions: {};

  events: {
    "ev_gig_data_updated(uint256,tuple)": EventFragment;
  };

  getEvent(nameOrSignatureOrTopic: "ev_gig_data_updated"): EventFragment;
}

export interface ev_gig_data_updatedEventObject {
  gig_id: BigNumber;
  gig: L_data_types.S_gigStructOutput;
}
export type ev_gig_data_updatedEvent = TypedEvent<
  [BigNumber, L_data_types.S_gigStructOutput],
  ev_gig_data_updatedEventObject
>;

export type ev_gig_data_updatedEventFilter =
  TypedEventFilter<ev_gig_data_updatedEvent>;

export interface L_gig_data_logic extends BaseContract {
  connect(signerOrProvider: Signer | Provider | string): this;
  attach(addressOrName: string): this;
  deployed(): Promise<this>;

  interface: L_gig_data_logicInterface;

  queryFilter<TEvent extends TypedEvent>(
    event: TypedEventFilter<TEvent>,
    fromBlockOrBlockhash?: string | number | undefined,
    toBlock?: string | number | undefined
  ): Promise<Array<TEvent>>;

  listeners<TEvent extends TypedEvent>(
    eventFilter?: TypedEventFilter<TEvent>
  ): Array<TypedListener<TEvent>>;
  listeners(eventName?: string): Array<Listener>;
  removeAllListeners<TEvent extends TypedEvent>(
    eventFilter: TypedEventFilter<TEvent>
  ): this;
  removeAllListeners(eventName?: string): this;
  off: OnEvent<this>;
  on: OnEvent<this>;
  once: OnEvent<this>;
  removeListener: OnEvent<this>;

  functions: {};

  callStatic: {};

  filters: {
    "ev_gig_data_updated(uint256,tuple)"(
      gig_id?: PromiseOrValue<BigNumberish> | null,
      gig?: null
    ): ev_gig_data_updatedEventFilter;
    ev_gig_data_updated(
      gig_id?: PromiseOrValue<BigNumberish> | null,
      gig?: null
    ): ev_gig_data_updatedEventFilter;
  };

  estimateGas: {};

  populateTransaction: {};
}
