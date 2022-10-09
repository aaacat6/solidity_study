// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract arrayShift {
    uint[] public array;

     function example() public {
         array = [1, 2, 3];
         delete array[1];
         assert (array[1] == 0);
         //这里assert用于确定该函数有正确的值,否则该函数会被回滚
         //如果该函数被回滚,则arrary不会有值
     } 

     //[1, 2, 3, 4, 5, 6] -- 通过循环,从(1)位开始,左移1位 -- [1, 3, 4, 5, 6, 6] -- 弹出数组最后一位[1, 3, 4, 5, 6]
     function remove(uint _num) public {
        //  array = [1, 2, 3, 4, 5, 6];
         //定义数组的值

         require(_num < array.length, "must < array.length");
         //确定输入的的数字不能大于数组的长度

        //  for (uint i = _num; i < array.length - 1; i++) {
        //      array[i] = array[i + 1];
        //      //给变量赋值是1个等号
        // }
             
        for (_num; _num < array.length - 1; _num++) {
        array[_num] = array[_num + 1];
        
        }
         //替换数组某位数字,并且让后续的数字往左移一位

         array.pop();
         //剔除最后一位数组
     }

     function test(uint _num) external {
         array = [1, 3, 5, 7];
         remove(_num);
         assert (array.length == 3);
         //将array数组中_num + 1 位移除,并且移除后数组长度为3
     }

     function test2() external {
         array = [1];
         remove(0);
         assert (array.length == 0);
         //将array数组变成空数组,如果结果不为空,则回滚函数
     }
}