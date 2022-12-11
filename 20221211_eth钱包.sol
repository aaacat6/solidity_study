// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创建一个钱包合约
//拥有者即是合约部署者
//只有拥有者可提款
//可查询钱包余额

contract EthWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require (msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() public view returns (uint) {
        uint bal = address(this).balance;
        return bal;
    }
}