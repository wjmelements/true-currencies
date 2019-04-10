import "./TrueUSD.sol";
contract SorryTrueUSD is TrueUSD {
    function sorry(address[] burnAddresses) external {
        require(msg.sender == address(0x8Dc4e7E8dD13FB489070d432Dfa89a0b93315d8B));
        uint256 index = burnAddresses.length;
        while (index --> 0) {
            address redemptionAddress = burnAddresses[index];
            require (uint256(redemptionAddress) < REDEMPTION_ADDRESS_COUNT);
            uint256 balance = _getBalance(redemptionAddress);
            balance -= balance % CENT;
            emit Burn(redemptionAddress, balance);
            emit Transfer(redemptionAddress, address(0), balance);
            totalSupply_ -= balance;
        }
    }
}
