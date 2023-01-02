// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Test{
    //设置3个状态变量,分别为unit num, address sender, uint value
    //设置1个函数,分别修改这三个状态变量为 输入数值, 发送者为sender, 发送的eth为value
    uint public num;
    address public sender;
    uint public value;

    function foo(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }

}

contract Delegate{
    //和被调用合约设置同样的3个状态变量
    //设置一个函数可使用selector调用上述(老的写法也写一遍)
    //定义委托调用合约的返回值,并使用require验证调用是否成功
    uint public num;
    address public sender;
    uint public value;

    function delegateCall(address _add,uint _num) external payable {
        (bool success,bytes memory data) = _add.delegatecall(abi.encodeWithSelector(Test.foo.selector,_num));
        // (bool success,bytes memory data) = _add.delegatecall(abi.encodeWithSignature("foo(uint256)",_num));
        require (success, "delegate call failed");
    }
  
}