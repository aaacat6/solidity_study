// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创建一个发送eth的合约SendEther
//创建构造函数,将该合约设置成可payable(测试没有该关键词)
//创建函数sendViaTransfer,测试transfer
//创建函数sendViaSend,测试Send,测试其返回的布尔值
//创建函数sendViaCall,测试Call,测试其返回的布尔值和data

contract SendEther {
    constructor() payable {}
    //为何开始要给构造函数payable呢?

    receive() payable external {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    } 

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }

    function sendViaCall(address payable _to) external payable {
        (bool sent,) = _to.call{value:123}("");
        require(sent, "call failed");
    }

    function getBal() external view returns (uint) {
        return address(this).balance;
    }
}

contract EthReceive {
    event log(uint amount, uint gas);

    receive() payable external {
        emit log(msg.value, gasleft());
    }
}