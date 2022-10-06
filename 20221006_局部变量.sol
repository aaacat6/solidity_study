// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract localVariable {
    uint public a = 1;
    bool public b = true;
    address public c;

    function _foo() external {
        //修饰函数时，如果只需要外部调取，则用external，最小权限开放原则
        uint d = 3;
        bool e = true;
        d += 1;
        e = false;
        //局部变量，不给retrun接口不会展示

        a = 2;
        b = false;
        c = address(1);
    }

    function _return() external {
        a = 1;
        b = true;
        c = address(0);
    }
}