// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// ERC165 Interface. Abstract function
interface IERC165 {
    function supportsInterface(bytes4 intefaceID) external view returns (bool);
}