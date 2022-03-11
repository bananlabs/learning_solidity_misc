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
   // check if is a supported interface
      function supportsInterface(bytes4 intefaceId) external override view returns (bool){
         return _supportedInterfaces[intefaceId];
    }
    // calculate fingerprint interface
    function caculateFigerprint() public view returns (bytes4){
       return bytes4(keccak256('supportsInteface(bytes4)'));
    }
   // registers a specific interface
   function _registerInterface(bytes4 interfaceId) public {
      // check if is a valid interface
      require(interfaceId != 0xffffffff, "ERC165: Invalid Interface!");
      _supportedInterfaces[interfaceId] = true;
   }
 
}