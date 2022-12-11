// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ArrayReplaceLast {
    // [1,2,3,4] -- remove(1) --> [1,4,3]
    //[1,4,3] -- remove(2) --> [1,4]
    uint[] public Arry;

    function remove(uint _index) public {
        Arry[_index] = Arry[Arry.length - 1];
        Arry.pop();
    }

    function test() external {
        Arry = [1,2,3,4];

        remove(1);

        assert(Arry.length == 3);
        assert(Arry[0] == 1);
        assert(Arry[1] == 4);
        assert(Arry[2] == 3);

        remove(2);

        assert(Arry.length == 2);
        assert(Arry[0] == 1);
        assert(Arry[1] == 4);
    }
}