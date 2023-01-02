// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract hashTest {
    function hash(string memory _str1,string memory _str2,uint num) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_str1,_str2,num));
    }

    function encodePacke(string memory _str1,string memory _str2) public pure returns(bytes memory) {
    return abi.encodePacked(_str1,_str2);
    }

    function encode(string memory _str1,string memory _str2) public pure returns(bytes memory) {
    return abi.encode(_str1,_str2);
    }

}