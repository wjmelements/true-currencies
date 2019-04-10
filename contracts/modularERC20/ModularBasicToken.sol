pragma solidity ^0.4.23;

import "../HasOwner.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

// Fork of OpenZeppelin's BasicToken
/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract ModularBasicToken is HasOwner {
    using SafeMath for uint256;

    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
    * @dev total number of tokens in existence
    */
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function _getBalance(address _who) internal view returns (uint256) {
        return balanceOf[_who];
    }

    function _addBalance(address _who, uint256 _value) internal returns (uint256 priorBalance) {
        priorBalance = balanceOf[_who];
        balanceOf[_who] = priorBalance.add(_value);
    }

    function _subBalance(address _who, uint256 _value) internal returns (uint256 result) {
        result = balanceOf[_who].sub(_value);
        balanceOf[_who] = result;
    }

    function _setBalance(address _who, uint256 _value) internal {
        balanceOf[_who] = _value;
    }
}
