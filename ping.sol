/* -- A simple contract that replies with 'pong'
   -- when you enter 'ping'. This contract make
   -- use of string manipulation which in solidity
   -- could be costly in terms of gas fee.
   -- Be careful when you use strings manipulation.
   -- This is just an exercise. 
   -- Its a good idea to use Remix IDE 
   -- to run those contracts.
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Ping {
    // Function that replies with 'pong' when user writes 'ping' 
    function sayPong(string memory _str) pure public returns(string memory){
        // string comparison in solidity
        if (keccak256(abi.encodePacked(_str)) == keccak256(abi.encodePacked("ping"))){
            // string concatenation and using unicode to write emoji in solidity
            return string(abi.encodePacked("Pong!", " ", unicode"💢")); 
        } else {
            string memory warning = "You must write 'ping'";
            return warning;
        }
    }
}
