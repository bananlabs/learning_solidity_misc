// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// take a name as input and generate a random number 
contract RandName {
    // a number with 16 digits i total will be generate
    uint totalDigits = 16;
    // we need assure after the modulus operation that 
    // we will get a 16 digit number
    uint digitModulus = 10 ** totalDigits;

    // generate a random ID from a person's name
    function _genereateRandomId(string memory _name) public view returns (uint){
        uint rand = uint(keccak256(abi.encodePacked(_name)));
        return rand % digitModulus;
    }
}