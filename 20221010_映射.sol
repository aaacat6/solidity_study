// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract mappingTest {
    mapping(address => uint) public balance;
    mapping(address => mapping(address => bool)) public isFriend;

    function test1() public {
        balance[msg.sender] = 123;
        uint a = balance[msg.sender];
        uint b = balance[address(1)];

        balance[msg.sender] += 111;

        delete balance[msg.sender]; //删除后返回uint默认值,0

        isFriend[msg.sender][address(this)] = true;
    }

}