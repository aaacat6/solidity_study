// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创建合约S,其中包含字符串变量,以及可输入的构造函数,赋予字符串变量值.
//船舰合约T,其中包含字符串变量,以及可输入的构造函数,赋予字符串变量值.
//创建合约U,继承S与T,并且创建该合约时自动输入固定的构造函数变量.
//创建合约V,使用内部构造函数,输入继承合约的构造函数变量.
//创建合约VV,一个使用自动输入构造合约变量,一个使用手动输入构造合约变量.

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

contract U is S("a"),T("b") {
}

contract V is S,T{
    constructor(string memory _name, string memory _text) S(_name) T(_text) {
    }
}

contract VV is S("a"), T {
    constructor(string memory _text) T(_text){
    }
}
