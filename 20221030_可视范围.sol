// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//四种可视范围:public external internal private
//private - only inside contract
//internal - only insdie contract and child contracts
//public - inside and outside contract
//external - only from outside contract

//创建一个VisibilityBase合约
//合约内创建3个变量,分别赋予可视范围 private internal public
//合约内创建5个函数,分别赋予可视范围 private internal public external
//合约内创建example验证函数(this可以访问外部函数)
//创建子合约VisibilityChild.
//子合约中创建验证函数2来验证可视范围

contract VisbilityBase {
    uint private priVar;
    uint internal interVar;
    uint public pubVar;

    function funPri() private pure returns(uint) {
    }

    function funInter() internal pure returns(uint) {

    }

    function funPub() internal pure returns(uint) {

    }

    function funExter() external pure returns(uint) {

    }

    function test1() public view {
        priVar + interVar + pubVar;

        funPri();
        funInter();
        funPub();
        this.funExter();
        //external需要添加this
    }
}

contract VisbilityChild is VisbilityBase {
    function test2() public view{
        /*priVar +*/ interVar + pubVar;
        //private无法再子合约使用

        // funPri();
        //private无法再子合约使用
        funInter();
        funPub();
        this.funExter();
    }
}