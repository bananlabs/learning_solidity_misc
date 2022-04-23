// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract CallFunctionWithoutContract {
    address public s_selectorsAndSignaturesAddress;

    constructor(address selectorsAndSignaturesAddress){
        s_selectorsAndSignaturesAddress = selectorsAndSignaturesAddress;
    }

    function callFunctionDirectly(bytes calldata callData) public returns(bytes4, bool){
        (bool success, bytes memory returnData) = s_selectorsAndSignaturesAddress.call(
            abi.encodeWithSignature("getSelectorThree(bytes)", callData)
        );
        return (bytes4(returnData), success);
    }

    function staticCallFunctionDirectly() public view returns(bytes4, bool){
         (bool success, bytes memory returnData) = s_selectorsAndSignaturesAddress.staticcall(
             abi.encodeWithSignature("getSelectorOne()")
         );
         return (bytes4(returnData), success);
    }

    function callTransferFunctionDirectly(address someAddress, uint256 amount) public returns(bytes4, bool){
        (bool success, bytes memory returnData) = s_selectorsAndSignaturesAddress.call(
            abi.encodeWithSignature("transfer(address, uint256)", someAddress, amount)
        );
        return (bytes4(returnData), success);
    }
}