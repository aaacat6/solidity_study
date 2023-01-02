// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Test{
    //2个变量,string message 和uint x
    //设置一个事件,以及回退函数,触发回退函数的时候触发事件
    //设置一个函数foo,赋予2个全局变量值,并返回布尔值以及uint数字值


    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("function not exist");
    }

    function foo(string memory _message,uint _x) public payable returns (bool, uint) {
        message = _message;
        x = _x;

        return (true, 999);

    }

}

contract Call{
    //通过call调用test合约中的foo函数,函数中通过require检测是否调用成功.
    //设置一个Data变量来储存其返回的data数据
    //测试调用一个不存在的函数,通过call

    bytes public data;

    function fooCall(address _add) external payable {
        (bool _success,bytes memory _data) = _add.call {value: 111} (
            abi.encodeWithSignature(
            "foo(string,uint256)","call foo",123
            )
        );

        require (_success,"call failed");
        data = _data;
    }

    function noExistFunCall(address _add) external {
            (bool _success,) = _add.call(abi.encodeWithSignature(
            "noExistFun()"
            )
        );
        require (_success,"call failed");
    }

}