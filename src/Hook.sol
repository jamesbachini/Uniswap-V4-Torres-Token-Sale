// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Hooks} from "@uniswap/v4-core/contracts/libraries/Hooks.sol";
import {BaseHook} from "@uniswap/v4-periphery/contracts/BaseHook.sol";

import {IPoolManager} from "@uniswap/v4-core/contracts/interfaces/IPoolManager.sol";
import {BalanceDelta} from "@uniswap/v4-core/contracts/types/BalanceDelta.sol";
import {PoolId} from "@uniswap/v4-core/contracts/libraries/PoolId.sol";

contract Hook is BaseHook {
    using PoolId for IPoolManager.PoolKey;
    uint public preSaleEnds = block.timestamp + 72 hours;
    uint minPreSale = 1000e18;

    constructor(IPoolManager _poolManager) BaseHook(_poolManager) { }

    function getHooksCalls() public pure override returns (Hooks.Calls memory) {
        return Hooks.Calls({
            beforeInitialize: false,
            afterInitialize: false,
            beforeModifyPosition: false,
            afterModifyPosition: false,
            beforeSwap: true,
            afterSwap: false,
            beforeDonate: false,
            afterDonate: false
        });
    }

    function beforeSwap(
        address,
        IPoolManager.PoolKey memory key,
        IPoolManager.SwapParams calldata params
    )
        external
        override
        returns (bytes4)
    {
        if (block.timestamp < preSaleEnds) {
            if (params.amountSpecified < minPreSale) {
                revert("Below Minimum For Presale");
            }
            // Could also add merkle tree whitelisting here
        }
        return BaseHook.afterSwap.selector;
    }
}
