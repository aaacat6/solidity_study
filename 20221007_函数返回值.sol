// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract functionReturn {
    function return1() public pure returns(uint, bool){
        return(1, true);
    }

    function return2() public pure returns(uint, bool){
        uint x = 1;
        bool b = true;
        return(x, b);
    }

    function return3() public pure returns(uint x,bool y){
        x = 1;
        y = true;
        //return(x, y);  return可不加
    }

    function return4() public pure returns(uint, bool, bool){
        (uint x,bool y) = return1();
        //注意格式，多个变量需要加括号
        (,bool z) = return1();
        //多个变量可以省略不用的，节省gas
        return (x, y, z);
    }

    function return5() public pure returns(uint x){
        x = 1;
        //如果returns中uint后面不跟变量名，则想要函数内返回值需要函数内加retrun
    }

    function return6() public pure returns(uint x){
        x = return5();
        //单个变量不需要加括号
    }

}