// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract sanYuan {
    function test(uint _x) public pure returns(uint){
        if (_x <= 10) {
            return 1;
        } else if (_x > 20){
            return 2;
        }
        return 3;
    }

    function test2(uint _y) public pure returns(uint){
        // if (_y <= 10) {
        //     return 1;
        // } else {
        //     return 2 ;
        // }
        return _y <= 10 ? 1 : 2;
    }
}