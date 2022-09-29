// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract aaacat {
    uint public a ;
    bool public b ;
    function add(uint _a,uint _b) public pure returns(uint) {
        return _a + _b;
    }
    function test() public {
        a = 1;
        b = true;
    }
}
