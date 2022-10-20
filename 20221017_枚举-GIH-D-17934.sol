// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract enumExercise {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    Status public status;

    //结构体套用 枚举
    struct Test {
        address a;
        Status b;
    }

    //结构体 类型 的数组
    Test[] public order;

    //得到枚举
    function get() external view returns(Status) {
        return status;
    }

    //设置枚举类型变量为用户输入的索引值
    function set(Status _status) external {
          status = _status;
    }
    //设置枚举类型变量索引为某一个枚举字符串
    function ship() external  {
        status = Status.Shipped;
    }

    //删除枚举类型的变量,让其回复到默认值
    function del() external {
        delete status;
    }


}