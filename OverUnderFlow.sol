// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/// @title Example of overflow and underflow attacks
/// @author @bananlabs
/// @notice this contract is an example to simulate underflow and overflow
/// in solidity. To fix this probem you have to use OpenZeppelin SafeMath

contract OverUnderFlow {
    uint256 zero_num = 0;
    uint256 max_num = 2**(256-1);
}
