// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract arrayShift2 {
    string[] public str = ["a", "b", "c"];

    function changeStr(uint a,string memory b) public {
        str[a] = b;
    }
    //修改0位为d,find_d函数还是无法找到d,不知为何.

    function find_d() public view returns(string memory){
        bytes32 dHash = keccak256(abi.encode("d"));
        
        for (uint i = 1; i < str.length; i++) {
           if( keccak256(abi.encode(str[i])) == dHash )  {
             return ("find d"); 
           }
        }

        return ("cant find d");
 
    } 
}