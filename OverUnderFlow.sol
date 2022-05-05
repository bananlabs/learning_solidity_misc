// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/// @title Example of overflow and underflow attacks
/// @author @bananlabs
/// @notice this contract is an example to simulate underflow and overflow
/// in solidity. To fix this probem you have to use OpenZeppelin SafeMath

contract OverUnderFlow {
    uint256 zero_num = 0;
    uint256 max_num = 2**(256-1);

    /// @notice add 1 to the maximum value of uint. After addition the variable
    // will be set to the zero.
    function overflow() public {
        max_num += 1;
    }

    /// @notice subtract 1 from zero. After subtraction the variable 
    // will be set to the maximum value
    function underflow() public {
        zero_num -= 1;
    }
}
