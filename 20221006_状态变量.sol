// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract stateVar{
    uint public a = 256;
    //状态变量

    function foo() public pure {
        uint b = 24;
        //局部变量
    }

}