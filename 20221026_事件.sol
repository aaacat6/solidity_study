// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract eventContract {
    //创建一个事件Log,拥有字符串和正整数变量
    //创建一个事件IndexedLog,拥有发送者地址和正整数变量,可外部检索发送者
    //创建一个外部调用函数,使用emit激活这两个事件并赋值
    //创建一个事件Message,包含发送者,接收者,以及发送的消息,可外部检索发送者以及接收者
    //创建一个外部调用函数,可输入接收者地址以及消息,函数内部emit激活事件Message,操作者-接收者-信息

    event Log (string message, uint val);
    event IndexLog (address indexed _sender, uint val);

    function test() external {
        emit Log ("foo", 123);
        emit IndexLog(msg.sender, 456);
    }

    event Message (address indexed _sender, address indexed _to, string message);

    function MessageFun (address _to, string memory message) external {
        emit Message (msg.sender, _to, message);
    }
    
}