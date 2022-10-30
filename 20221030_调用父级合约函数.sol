// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//调用父合约函数
//创建合约E,包含事件log,其中有字符串变量message.
//合约内有函数foo和函数bar,可执行事件log,得到不同的值.
//创建合约F,G,继承E的函数,其中尝试使用调用父函数的值以及super关键词,寻找函数最根植.
//创建合约H,继承合约F,G,其中尝试使用调用父函数的值以及super关键词,寻找函数最根植.
//测试合约H的运行.

contract E {
    event Log (string message);

    function foo() public virtual  {
        emit Log ("E foo");
    }

    function bar() public virtual {
        emit Log ("E bar");
    }
}

contract F is E{
    function foo() public virtual override  {
        emit Log ("F foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log ("F bar");
        super.bar();
        //super寻找的是函数的上一级继承函数.
    }
}

contract G is E {
    function foo() public virtual override  {
        emit Log ("G foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log ("G bar");
        super.bar();
    }
}

contract H is F, G {
    function foo() public  override (F, G)  {
        emit Log ("H foo");
        F.foo();
    }

    function bar() public  override (F, G) {
        emit Log ("H bar");
        super.bar();
    }
    //继承多个合约,override后括号里也要写上继承的合约名.
    //因为继承了两个合约,所以H合约中super会自动寻找上两个合约的父函数.
}