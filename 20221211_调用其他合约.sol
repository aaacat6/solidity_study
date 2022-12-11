// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract getFun{
    // function setx(address _test,uint _x) external {
    //     TestContract(_test).setx(_x);
    // }
    //写法1

    function setx(TestContract _test,uint _x) external {
        _test.setx(_x);
    }   
    //写法2


    //  function getx(TestContract _test) external view returns(uint) {
    //      uint x = _test.getx();
    //      return x;
    //  }  
    //  写法1

    // function getx(TestContract _test) external view returns(uint) {
    //     return _test.getx();
    // }  
    // 写法2

    function getx(TestContract _test) external view returns(uint x) {
        x = _test.getx();
    }   
    //写法3 


    function setReceiveEther(TestContract _test,uint _x) external payable {
        _test.setReceiveEther{value: msg.value}(_x);
    }   

    function getReceiveEther(TestContract _test) external view returns(uint x,uint value) {
        (x,value) = _test.getReceiveEther();
    }   
}

contract TestContract{
    //定义x变量,定义value变量,都为uint
    //2个函数,1个定义x的值,1个读取x的值
    //2个函数,可接受eth,一个定义x的值,定义value的值,一个读取这两个值

    uint public x;
    uint public value;

    function setx(uint _x) external {
        x = _x;
    }

    function getx() external view returns(uint) {
        return x;
    }

    function setReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getReceiveEther() external view returns(uint,uint) {
        return (x,value);
    }

    function getContractBal() external view returns(uint) {
        return address(this).balance;
    } 

}