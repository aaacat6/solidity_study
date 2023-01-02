// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Kill{
    //创建构造函数,让其合约部署时可以发送主币
    //创建自毁函数,使用关键字selfdestruct
    //创建测试函数,返回123
    constructor() payable {}

    function _kill() external  {
        selfdestruct(payable(msg.sender));
    }

    function _test() external pure returns (uint) {
        return 123;
    }

}

contract Helper{
    //创建函数可查询余额
    //调用Kill合约中的自毁函数
    function getBalanace() external view returns (uint) {
        return address(this).balance;
    }

    function kill(Kill _kill) external {
        _kill._kill();
    }

}