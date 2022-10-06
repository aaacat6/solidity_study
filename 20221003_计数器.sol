// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract counter {
uint public count = 1;

function add() external {
    count += 1;
}

function min() external {
    count -= 1;
}

}

/*
添加return后一样可以运作:

contract counter {
uint public count = 1;

function add() external returns(uint){
    count += 1;
    return(count);
}

function min() external returns(uint){
    count -= 1;
    return(count);
}

}
*/
