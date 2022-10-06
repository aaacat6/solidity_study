// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner() {
        owner = _newOwner;
    }

    function onlyOwnerCanCallThisFunction() external onlyOwner() {
        //code
    }

    function everyoneOwnerCanCallThisFunction() external {
        //code
    }

}