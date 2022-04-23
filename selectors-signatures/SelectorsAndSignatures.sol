// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SelectorsAndSignatures {
    address public someAddress;
    uint256 public someAmount;

    function getSelectorOne() public pure returns(bytes4 selector){
        selector = bytes4(keccak256(bytes("transfer(address,uint256")));
    }

    function getSelectorTwo() public view returns(bytes4 selector){
        bytes memory functionCallData = abi.encodeWithSignature("transfer(address,uint256)", address(this), 123);
        selector = bytes4(bytes.concat(functionCallData[0], functionCallData[1], functionCallData[2], 
        functionCallData[3]));
    }
}