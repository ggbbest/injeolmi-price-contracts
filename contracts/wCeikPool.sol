pragma solidity ^0.5.6;

import "./klaytn-contracts/math/SafeMath.sol";
import "./interfaces/IwCeikPool.sol";
import "./interfaces/IwCeik.sol";

contract wCeikPool is IwCeikPool {
    using SafeMath for uint256;

    IwCeik public wceik;

    constructor(IwCeik _wceik) public {
        wceik = _wceik;
    }

    function () payable external {}

    function swapTowCEIK() external payable {
        uint256 newKlay = address(this).balance;
        uint256 lastwCEIK = wceik.balanceOf(address(this));

        uint256 newwCEIK = (newKlay.sub(msg.value)).mul(lastwCEIK).div(newKlay);

        wceik.transfer(msg.sender, lastwCEIK.sub(newwCEIK));

        emit SwapTowCEIK(msg.sender, msg.value);
    }

    function swapToKlay(uint256 amount) external {
        uint256 lastKlay = address(this).balance;
        uint256 lastwCEIK = wceik.balanceOf(address(this));

        uint256 newKlay = lastwCEIK.mul(lastKlay).div(lastwCEIK.add(amount.mul(9).div(10)));

        wceik.transferFrom(msg.sender, address(this), amount);
        msg.sender.transfer(lastKlay.sub(newKlay));

        emit SwapToKlay(msg.sender, amount);
    }

    function addLiquidity() external payable {
        uint256 lastKlay = (address(this).balance).sub(msg.value);
        uint256 lastwCEIK = wceik.balanceOf(address(this));

        uint256 inputwCEIK = lastwCEIK.mul(msg.value).div(lastKlay);
        if(wceik.excluded(msg.sender)) {
            wceik.transferFrom(msg.sender, address(this), inputwCEIK);
        } else {
            wceik.transferFrom(msg.sender, address(this), inputwCEIK.mul(10).div(9));
        }
    }
}
