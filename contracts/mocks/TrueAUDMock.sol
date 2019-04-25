pragma solidity ^0.4.23;

import "../TrueAUD.sol";

contract TrueAUDMock is TrueAUD {
    constructor(address initialAccount, uint256 initialBalance) public {
        _setBalance(initialAccount, initialBalance);
        totalSupply_ = initialBalance;
        initialize();
    }

    function initialize() public {
        require(!initialized, "already initialized");
        initialized = true;
        owner = 0xcDbd95534b5a980f33d1acDEe4dB7cc1eB8A31De;
        burnMin = 1000 * 10**uint256(DECIMALS);
        burnMax = 20000000 * 10**uint256(DECIMALS);
    }

    function setTotalSupply(uint _totalSupply) public onlyOwner {
        require(totalSupply_ == 0);
        totalSupply_ = _totalSupply;
    }

    address delegateFrom;

    function setDelegateFrom(address _delegateFrom) {
        delegateFrom = _delegateFrom;
    }

    modifier onlyDelegateFrom() {
        require(msg.sender == delegateFrom);
        _;
    }
}
