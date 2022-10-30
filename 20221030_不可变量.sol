// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创建合约Immutable
//创建地址变量,等于消息发送者,讲该地址变量赋予immutable.注意此处有2种写法,直接地址变量赋值;或者使用构造函数赋值.
//创建一个函数,通过require来验证当前地址变量是消息发送者.

contract ImmutableCon {
    address immutable owner /*= msg.sender*/;

    constructor () {
        owner = msg.sender;
    }

    uint public x;
    function test() external {
        require (msg.sender == owner);
        x += 1;
    }
}