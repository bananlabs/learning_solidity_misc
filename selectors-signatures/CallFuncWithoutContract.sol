// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract CallFunctionWithoutContract {
    address public s_selectorsAndSignaturesAddress;

    constructor(address selectorsAndSignaturesAddress){
        s_selectorsAndSignaturesAddress = selectorsAndSignaturesAddress;
    }
}