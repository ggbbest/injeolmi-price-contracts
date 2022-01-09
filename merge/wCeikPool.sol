pragma solidity ^0.5.6;
/**


Metadata of "wceikpool" was published successfully.
wCeikPool.sol : ipfs://QmbFMke1KXqnYyBBWxB74N4c5SBnJMVAiMNRcGu6x1AwQH
metadata.json : ipfs://QmcRtJyFdBAEoK5evVAEhu2AvDCQwJjgVYDQ5rNytQG7re

0x796EA025F2714cff79C4eAaA46D0781152548330  --> arg[0]:0xEAD262b2dFEf461CF1C5Ff003fd59DDA82f7Eaa3

 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

interface IwCeikPool {

    event SwapTowCEIK(address indexed user, uint256 amount);
    event SwapToKlay(address indexed user, uint256 amount);

    function swapTowCEIK() payable external;
    function swapToKlay(uint256 amount) external;
}

interface IwCeik {

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external pure returns (uint256);

    function excluded(address user) external view returns (bool);
    function _userInfo(address user) external view returns (uint256 lastBalance, uint256 lastMultiplier, uint256 resettingCount);

    function balanceOf(address owner) external view returns (uint256 balance);
    function transfer(address to, uint256 amount) external returns (bool success);
    function transferFrom(address from, address to, uint256 amount) external returns (bool success);
    function approve(address spender, uint256 amount) external returns (bool success);
    function allowance(address owner, address spender) external view returns (uint256 remaining);
}

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