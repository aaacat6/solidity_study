// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract test1 {
    //消耗gas 21420  
    address public constant MY_ADDRESS = 0x6A7652fBEa220B8f992B8e43AF004b0621f60B56;

    // function ChangeAddress() public {
    //     MY_ADDRESS = address(0);

    // }
}

contract test2 {
    //消耗gas 23553
    address public myAddress = 0x6A7652fBEa220B8f992B8e43AF004b0621f60B56;

    function ChangeAddress() public {
        myAddress = address(0);
    }
}