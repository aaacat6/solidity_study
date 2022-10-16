// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract setMapping {
    mapping(address => uint) public balance;
    mapping(address => bool) public inserted;
    address[] public keys;
    //设置映射以及数组

    function set(address _key, uint _val) public {
        balance[_key] = _val;
        //赋予balance数组一组值

        if(!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
            //使用If判断的意义在于,插入keys数组后,如果输入同样的address值,不会重复插入
        }
    }

    function getLength() public view returns(uint) {
        return keys.length;

    }

    function getFirst() public view returns(uint) {
        return balance[keys[0]];
    }

    function getLast() public view returns(uint) {
        return balance[keys[keys.length - 1]];
    }

    function get(uint _num) public view returns(uint) {
        return balance[keys[_num]];
    }

}