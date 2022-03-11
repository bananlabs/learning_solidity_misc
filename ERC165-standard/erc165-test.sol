/* -- These contracts is to document my learning
   -- in Solidity Language. My introductio to 
   -- ERC 165 standard. Ξ 
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "./erc165.sol";

// contract ERC165 inherits IERC165
contract ERC165 is IERC165 {
   // create table for interfaces 
   mapping(bytes4 => bool) private _supportedInterfaces;
   
    // calculate fingerprint interface
    function caculateFigerprint() public view returns (bytes4){
       return bytes4(keccak256('supportsInteface(bytes4)'));
    }
}