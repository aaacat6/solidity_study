// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创建合约A,其中3个函数,分别返回字符串A,B,C;函数使用virtual让其可继承并修改
//创建合约B,其中函数和合约A同名,使用override让该函数被修改
//合约B已继承的函数,也可以继续被合约C继承,需要同事添加virtual和override参数.

contract A {
    function Afun() public virtual pure returns(string memory) {
        return "A";
    }

    function Bfun() public virtual pure returns(string memory) {
        return "B";
    }

    function Cfun() public virtual pure returns(string memory) {
        return "C";
    }
}

contract B is A {
    function Afun() public virtual override pure returns(string memory) {
        return "contract B A";
    }

    function Bfun() public override pure returns(string memory) {
        return "contract B B";
    }

}
    
 contract C is B {
    function Afun() public override pure returns(string memory) {
        return "contract C A";
    }
 }