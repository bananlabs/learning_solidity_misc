// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/// @title Getting Selectors and Signatures
/// @author @bananlabs
/// @notice functions to take the selectors and signatures from a specific function 
// inspiring by @PatrickAlphaC solidity tips

contract SelectorsAndSignatures {
    address public someAddress;
    uint256 public someAmount;

    /// @notice The first 4 bytes of the call data for a function call that specifies the function to be called.
    /// @return selector first 4 bytes of the call data for an especific function
    function getSelectorOne() public pure returns(bytes4 selector){
        selector = bytes4(keccak256(bytes("transfer(address,uint256")));
    }

    /// @notice second method to get the selector
    /// @return selector first 4 bytes of the call data for an especific function
    function getSelectorTwo() public view returns(bytes4 selector){
        bytes memory functionCallData = abi.encodeWithSignature("transfer(address,uint256)", address(this), 123);
        selector = bytes4(bytes.concat(functionCallData[0], functionCallData[1], functionCallData[2], 
        functionCallData[3]));
    }

    /// @notice function to get the complete call data of an specific function
    /// @return CallData in hex string
    function getCallData() public view returns(bytes memory){
        return abi.encodeWithSignature("transfer(address,uint256)", address(this), 123);
    }

    /// @notice third method passing the call data string as argument
    /// @param functionCallData hex string of returned by getCallData()
    /// @return selector first 4 bytes of the call data for an especific function
    function getSelectorThree(bytes calldata functionCallData) public pure returns(bytes4 selector){
        assembly {
            selector := calldataload(functionCallData.offset)
        }
    }

    /// @notice function to transfer some amount
    /// @param _someAddress the address used to transfer
    /// @param _someAmount the amount to transfer
    function transfer(address _someAddress, uint256 _someAmount) public {
        someAddress = _someAddress;
        someAmount = _someAmount;
    }

    /// @notice another way to get the selector
    /// @return selector first 4 bytes of the call data for an especific function
    function getSelectorFour() public pure returns(bytes4 selector){
        return this.transfer.selector;
    }

    /// @notice get the signature from a specific function
    /// @return signature string signature of a function
    function getSignatureOne() public pure returns(string memory){
        return "transfer(address,uint256)";
    }
}