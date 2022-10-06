// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;


contract funcionModifier {
    bool public pause;
    uint public count = 3;

    function setPause(bool _pause) external {
        pause = _pause;
    }

    modifier pauseModifier() {
        require (!pause,"paused");
        _;
    }

    function inc() external pauseModifier() {
        count += 2;
    }

    function min() external pauseModifier() {
        count -= 1;
    }

    modifier incForModifer(uint _x) {
        require (_x < 10, "x >= 10");
        count += _x;
        _;
        require (count > 11,"no");
        //得到负值的话，之后的运算会出错.
        count -= 11;
    }

    function incFor(uint _x) external incForModifer(_x) {
        count += 5;
    }
}


// contract funcionModifier {
//     bool public pause;
//     uint public count = 3;

//     function setPause(bool _pause) external {
//         pause = _pause;
//     }

//     function inc() external {
//         require (!pause,"paused");
//         count += 2;
//     }

//     function min() external {
//         require (!pause, "pause");
//         count -= 1;
//     }
// }