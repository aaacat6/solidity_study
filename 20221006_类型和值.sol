// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract typeAndVaule {
    bool public b = true;

    uint public a = 1;  
    // unit = uint256 0 to 2**256 - 1; 
    //        uint16 0 to 2**16 - 1;
    //        uint8 0 to 2**8 - 1;
    int public c = 2; 
    //int = int256 -2**255 to 2**255-1
    //      int128 -2**127 to 2**127-1

    int public max = type(int).max;
    int public min = type(int).max;

    address public d = 0x6A7652fBEa220B8f992B8e43AF004b0621f60B56;
    bytes32 public e ;
}