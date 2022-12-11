// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//设置一个可支付的地址变量
//通过构造函数将该地址变量设置为msg.sender
//创建一个函数,用来发送eth到合约地址
//创建一个函数,用来查询当前合约地址余额

contract payableCon {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposite() public payable {}

    function getBal() public view returns (uint) {
        uint bal = address(this).balance;
        return bal;
    }
}