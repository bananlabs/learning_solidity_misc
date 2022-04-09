// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/// @title A Reentrancy Attack Example 
/// @author banana labs
/// @notice this contract is for study purpose
contract Vault {
    mapping(address => uint) public balances;
    
    /// @notice deposits the amount to accounts
    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }

    /// @notice withdraw the value from balance
    // problem in this function: the update is after the external call
    // which permit the reentrancy attack
    function withdraw() public{
        uint balance = balances[msg.sender];
        require(balance > 0);

        (bool sent, ) = msg.sender.call{value: balance}("");
        require(sent, "Failed to send ether");

        //FIXME updating balance after external call
        balances[msg.sender] = 0; 
    }

    /// @notice helper function to check contract balance
    /// @return Return the current value of the balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}