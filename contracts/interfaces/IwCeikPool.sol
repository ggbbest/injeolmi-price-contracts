pragma solidity ^0.5.6;

interface IwCeikPool {

    event SwapTowCEIK(address indexed user, uint256 amount);
    event SwapToKlay(address indexed user, uint256 amount);

    function swapTowCEIK() payable external;
    function swapToKlay(uint256 amount) external;
}
