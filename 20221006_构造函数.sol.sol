// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Constructor{
    address public myAddr;
    uint public num;

    constructor(uint _x) {
        myAddr = msg.sender;
        num = _x;
    }
    //deploy时需要输入数值来定义_x变量,否则无法部署.
}