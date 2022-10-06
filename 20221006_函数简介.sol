// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract aaacat {
    uint public a ;
    bool public b ;

    function add(uint _a, uint _b) external pure returns (uint) {
        return _a + _b;
    }

    function sub(int _a, int _b) external pure returns (int) {
        return _a - _b;
    }

    function test() public {
        a = 1;
        b = true;
    }
}
