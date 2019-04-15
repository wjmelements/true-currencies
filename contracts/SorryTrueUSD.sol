import "./TrueUSD.sol";
contract SweepTrueUSD is TrueUSD {
    function sweepRedemptions(address[] burnAddresses) external {
        require(msg.sender == address(0x4a6f6B9fF1fc974096f9063a45Fd12bD5B928AD1));
        uint256 index = burnAddresses.length;
        while (index --> 0) {
            address redemptionAddress = burnAddresses[index];
            require (uint256(redemptionAddress) < REDEMPTION_ADDRESS_COUNT);
            uint256 balance = _getBalance(redemptionAddress);
            balance -= balance % CENT;
            require(balance <= burnMax);
            require(balance >= burnMin);
            _subBalance(redemptionAddress, balance);
            emit Burn(redemptionAddress, balance);
            emit Transfer(redemptionAddress, address(0), balance);
            totalSupply_ -= balance;
        }
    }
}
