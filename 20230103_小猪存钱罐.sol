// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创建一个合约,设置owner为msg.sender.
//创建一个receive回退函数可以接受主币.
//创建一个自毁函数,可以提款和销毁合约.
//创建2个事件,分别记录存款和提款.

contract Piggy{
    address public owner;
    event Deposite(uint amount);
    event Widthdraw(uint amout);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable{
        emit Deposite(msg.value);

    }

    modifier onlyOwner() {
        require (msg.sender == owner, "not owner");
        _;
    }

    function widthdraw() external  onlyOwner() {
        emit Widthdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}