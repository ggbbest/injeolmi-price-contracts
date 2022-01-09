pragma solidity ^0.5.6;

import "./klaytn-contracts/math/SafeMath.sol";
import "./interfaces/ICeik.sol";
import "./interfaces/ICeikPool.sol";

contract CeikPrice {
    using SafeMath for uint256;

    ICeik public ceik;
    ICeikPool public pool;

    constructor(ICeik _ceik, ICeikPool _pool) public {
        ceik = _ceik;
        pool = _pool;
    }

    function price() external view returns (uint256) {
        return address(pool).balance.mul(1e8).div(ceik.balanceOf(address(pool)));
    }
}
