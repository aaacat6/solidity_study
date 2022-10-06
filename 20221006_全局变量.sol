// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract globalVariable {
    address public sender = msg.sender;
    uint public timestamp = block.timestamp;
    uint public blockNum = block.number;
    
    function _globalVariable() external view returns (address, uint, uint) {
        return (sender, timestamp, blockNum);
    }
}