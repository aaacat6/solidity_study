// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Array {
    uint[] public nums = [1, 2, 3];
    uint[4] public unmsFixed = [1, 2, 3, 4];
    //部署后查询时需要输入数组位数

    function pushNums() external {
        nums.push(4);
        //该函数修改了数组nums，在其后插入一位长度,赋值4;
    }

    function popNums() external {
        nums.pop();
        //该函数修改了数组nums，在其后删除一位长度
    }

    function lengthNums() external view returns(uint){
        uint _length = nums.length;
        return _length;
        //该函读取数组长度
    }

    function delNums(uint _x) external {
        delete nums[_x];
        //该函数修改了数组nums，将其第_x-1位数字改成初始值"0"
    }

    function changeNums(uint _x) external {
        nums[_x] = 123;
        //该函数修改了数组nums，将其第_x-1位数字改成123
    }

    function numsMemory(uint _x) external pure returns(uint){
        uint[] memory _numsMemory = new uint[](5);
        //uint[] a = [1, 2, 3]
        //函数中的数组必须要加memory,函数中的数组为内存数组
        _numsMemory[1] = 123;
        //该函数为创建了5位长度的内存数组,并且将其第二位修改成123
        return _numsMemory[_x];
        //返回numsMemory的第_x值
    }

    function returnNums() external view returns (uint[] memory) {
        return nums;
        //返回函数nums完整制值.
    }
}