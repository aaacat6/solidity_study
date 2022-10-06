// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract errorControl {
    string public helloWorld = "hello world!";

    function testRequire(uint256 _a) public pure returns (uint256) {
        require(_a > 10, "_a > 10");
        uint256 b = 2;
        return b;
    }

    function testRevert(uint256 _a) public pure returns (uint256) {
        if (_a > 1) {
            if (_a > 10) {
                revert("_a > 10");
            }
        }
        //if可以嵌套

        uint256 b = 2;
        return b;
        //注意,require和revert是相反的.require满足条件则执行.revert满足条件则报错.
    }

    uint256 public a = 256;

    function testAssert() external view {
        assert(a == 1);
        //点击该函数会判断 true/false.弱为false,则回滚函数变量到初始值.
    }

    error myError(address, uint256);

    function testCustomError(uint256 _a) public view {
        if (_a > 10) {
            revert myError(msg.sender, _a);
        }
        //error(类似函数),括号内定义一些变量类型(测试不给变量名也可以,类似函数的retruns),revert错误时给予变量名.
    }
}
