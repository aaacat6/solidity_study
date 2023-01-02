// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创建一个库合约,可通过if else比较两个uint数值的大小
//创建一个新的合约,可引用该库合约
//创建一个库合约,可索引取值
//创建一个新的合约,可引用该索引库合约

library Math {
    function math(uint x,uint y) internal pure returns(uint) {
       return x >= y ? x : y;
    }

}

contract Test {
    function testMath(uint _x,uint _y) external pure returns(uint) {
        return Math.math(_x,_y);
    //测试后发现此处输入的变量名无需和库合约中输入变量名相同,数据类型和变量数量一致即可
    }
}

library Array {
    function find(uint[] storage arr,uint x) internal view returns(uint) {
        for (uint i = 0; i <= arr.length; i++ ) {
            if(arr[i] == x){
                return i;
            }
        }
        revert ("not found");
    }
}

contract ArrayTest {
    using Array for uint[];
    uint[] public arr1 = [3,2,1];

    function arrayTest(uint _x) external view returns(uint){
        // return Array.find(arr,_x);
        return arr1.find(_x);
    }
    //此处arr命名无需和librabry中一致
}