// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract xunhuan {
    function xunhuan1() external pure returns (uint256, uint256) {
        uint256 i;
        for (i = 0; i < 10; i++) {
            //code
            if (i <= 3) {
                continue;
            }
            //more code
            if (i > 5) {
                break;
            }
        }

        uint256 j = 0;
        while (j < 10) {
            //code
            j++;
        }
        return (i, j);
    }

    function sum(uint256 _n) external pure returns (uint256) {
        //uint默认值是0.
        uint256 s;
        for (uint256 i = 1; i <= _n; i++) {
            s += i;
        }
        return s;
    }
}
