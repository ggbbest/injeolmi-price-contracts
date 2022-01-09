pragma solidity ^0.5.6;

import "./klaytn-contracts/ownership/Ownable.sol";
import "./klaytn-contracts/math/SafeMath.sol";
import "./interfaces/IwCeik.sol";

contract Airdrop is Ownable {
    using SafeMath for uint256;

    IwCeik public wceik;

    constructor(IwCeik _wceik) public {
        wceik = _wceik;
    }

    function airdrop(address[] calldata to, uint256 amount) payable external onlyOwner {
        uint256 len = to.length;
        for (uint256 i = 0; i < len; i = i.add(1)) {
            wceik.transfer(to[i], amount);
        }
    }
}
