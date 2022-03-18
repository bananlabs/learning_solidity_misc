// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// This version will add a mapping table that associate
// the name to the random number
contract RandNameTwo {
    
    struct Names {
        uint256 randomId;
        string name;
    }

    // instantiate a Names object
    Names[] public myName;
    
    mapping(string => uint256) public nameToRandomId;

    uint totalDigits = 16;
    // we need assure after the modulus operation that 
    // we will get a 16 digit number
    uint digitModulus = 10 ** totalDigits;

    // generate a random ID from a person's name
    function _genereateRandomId(string memory _name) internal view returns (uint){
        uint rand = uint(keccak256(abi.encodePacked(_name)));
        return rand % digitModulus;
    }

    function addingName(string memory _name) public {
        uint256 myID = _genereateRandomId(_name);
        // insert a new name to the list
        myName.push(Names(myID, _name));
        // get the random id from the name
        nameToRandomId[_name] = myID;
    }

}