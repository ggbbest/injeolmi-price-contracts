pragma solidity ^0.5.6;

interface ICeikPool {

    event SwapToCEIK(address indexed user, uint256 amount);
    event SwapToKlay(address indexed user, uint256 amount);

    function swapToCEIK() payable external;
    function swapToKlay(uint256 amount) external;
}
