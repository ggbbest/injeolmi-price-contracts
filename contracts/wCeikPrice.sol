pragma solidity ^0.5.6;

import "./klaytn-contracts/math/SafeMath.sol";
import "./interfaces/IwCeik.sol";
import "./interfaces/IwCeikPool.sol";

contract wCeikPrice {
    using SafeMath for uint256;

    IwCeik public wceik;
    IwCeikPool public pool;

    constructor(IwCeik _wceik, IwCeikPool _pool) public {
        wceik = _wceik;
        pool = _pool;
    }

    function price() external view returns (uint256) {
        return address(pool).balance.mul(1e8).div(wceik.balanceOf(address(pool)));
    }
}
