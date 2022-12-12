// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// contract Counter{
//     uint public count;

//     function inc() external {
//         count += 1;
//     }

//     function dec() external {
//         count -= 1;
//     }
// }

interface ICounter {
    function count() external view returns(uint);
    function inc() external;
    function dec() external;
}

contract CallInterface {
    uint public count;

    function callInc(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }

    function callDec(address _counter) external {
        ICounter(_counter).dec();
        count = ICounter(_counter).count();
    }
}