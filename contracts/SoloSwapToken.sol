// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >= 0.7.0 < 0.9.0;
pragma abicoder v2;

import "@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol";
import "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";

contract SoloSwapToken{
    ISwapRouter public constant swapRouter =  ISwapRouter
    (0xE592427A0AEce92De3Edee1F18E0157C05861564);

    // address public constant token2 =  0x6B175474E89094C44Da98b954EedeAC495271d0F;
    // address public constant token1 = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    // address public constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    function soloSwapTokenExactInput(address token1, address token2, uint amountIn) external returns (uint amountOut){
        TransferHelper.safeTransferFrom(token1, msg.sender, address(this), amountIn);
        TransferHelper.safeApprove(token1, address(swapRouter), amountIn);
        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams({
            tokenIn: token1,
            tokenOut: token2,  
            fee: 3000,
            recipient: msg.sender,
            deadline: block.timestamp,
            amountIn: amountIn,
            amountOutMinimum: 0,
            sqrtPriceLimitX96: 0
        });

        amountOut = swapRouter.exactInputSingle(params);
    }
    function soloSwapTokenExactOutput(address token1, address token2, uint amountOut, uint amountInMax) external returns (uint amountIn){
        TransferHelper.safeTransferFrom(token1, msg.sender, address(this), amountInMax);
        TransferHelper.safeApprove(token1, address(swapRouter), amountInMax);
        ISwapRouter.ExactOutputSingleParams memory params = ISwapRouter.ExactOutputSingleParams({
            tokenIn: token1,
            tokenOut: token2,
            fee: 3000,
            recipient: msg.sender,
            deadline: block.timestamp,
            amountOut: amountOut,
            amountInMaximum: amountInMax,
            sqrtPriceLimitX96: 0
        });
        amountIn = swapRouter.exactOutputSingle(params);
        if(amountIn < amountInMax){
            TransferHelper.safeApprove(token1, address(swapRouter), 0);
            TransferHelper.safeTransfer(token1, msg.sender, amountInMax-amountIn);
        }
    }
}
