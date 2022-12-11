// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract dataLocations {
    //定义一个结构体,其中有uint和string类型变量
    struct MyStruct {
        string text;
        uint foo;
    }

    //定义一个映射,让address对应上面的结构体3
    mapping (address => MyStruct) public myStructs;

    //定义一个函数,其中给予映射赋值: msg.sender 赋值 结构体(随便写几个参数)
    function test() public returns(uint[] memory) {
    //函数内创建储存位置的 结构体变量,并赋值为 映射中的msg.sender 的值,测试修改结构体中的某个值
    //创建3位长度的内存变量数组,并且定义其第一位数组的值,return该值
        myStructs[msg.sender] = MyStruct({text: "hi", foo: 123});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "hello";
        //此处有疑惑  a = b,如果修改了 a 的值,b 也会改变吗?
        //使用了storage后,即会出现这种情况,修改了a的值,b会改变但是如果使用memory,则不会出现这种情况

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 888;

        // return readOnly;

        uint[] memory numArr = new uint[](3);
        numArr[0] = 111;

        return numArr;
    }

    //创建一个函数,输入变量为_internal,测试calldata储存位置.

    function test1(string calldata x) public pure returns (string memory) {
        return x;
    }

    function test2(string calldata x) public pure returns (string memory) {
        return x ;
    }


}