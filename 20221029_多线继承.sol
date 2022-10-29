// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创建合约X,其中包含3个可继承修改函数
//创建合约Y,继承X
//创建合约Z,继承X,Y;注意继承顺序,先基础,再派生

contract X {
    function foo() public pure virtual returns (string memory) { 
        return "a";
    }

    function bar() public pure virtual returns (string memory) {
        return "b";
    }

    function x() public pure returns (string memory) {
        return "x";
    }
}

contract Y is X {
    function foo() public pure virtual override returns (string memory) {
        return "X a";
    }

    function bar() public pure virtual override returns (string memory) {
        return "X b";
    }

    function y() public pure returns (string memory) {
        return "y";
    }
}

contract Z is X,Y {
    function foo() public pure override(X,Y) returns (string memory) {
        return "Z a";
    }

    function bar() public pure override(Y,X) returns (string memory) {
        return "Z b";
    }

    function z() public pure returns (string memory) {
        return "Z";
    }
}