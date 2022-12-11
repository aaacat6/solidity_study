// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//合约中创建一个事件,用于记录回退函数,事件包含 string,发送者地址,发送数额,发送时附带data.
//创建fallback函数,并且激活事件.
//创建recieve函数,并且激活事件.
//使用calldata调用合约

contract fallbackCon {
    event Log(string fun, address sender, uint value, bytes data);

    fallback () external payable  {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }
    //有msg.data数据时调用fallback.

    receive () external payable {
       emit Log("recieve", msg.sender, msg.value, "");
    }
    //没有msg.data时调用receive

    function getBal() public view returns (uint) {
        uint bal = address(this).balance;
        return bal;
    }

    //当合约中没有receive函数时,无论如何都时调用fallback
    //当合约中没有fallback函数,如果带有msg.sender调用,会报错
}