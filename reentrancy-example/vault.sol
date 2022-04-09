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

    
}