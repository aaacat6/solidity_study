// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract simpleStorage {
    string public test;

    function set(string memory _test) public {
       test = _test;
       //此处如果写成_test = test,则函数需要加view,因为_test局部变量会被赋值字符串的默认值,既"".
    }

    function get() public view returns (string memory) {
        return test;
    }
}



//设置一个字符串变量
//使用函数给予该字符串变量赋值,赋值时测试memory和calldata
//返回该值