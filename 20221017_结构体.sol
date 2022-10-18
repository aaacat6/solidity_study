// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract structTest {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping ( address => Car ) public carOwner;

    function CarSet() public {
        Car memory toyota = Car ("toyota", 1999, msg.sender);
        Car memory bmw = Car ({model: "bmw", year: 1989, owner: msg.sender});
        //注意此处 小括号中套大括号
        Car memory fiat;
        fiat.model = "fiat";
        fiat.year = 1998;
        fiat.owner = msg.sender;

        cars.push (toyota);
        cars.push (bmw);
        cars.push (fiat);
        //注意此处推入的是上面定义结构体的值,推入后就从局部变量变成了状态变量.

        cars.push(Car("ferrai", 1898, msg.sender));
        //可直接往数组中推入该结构体的数据内容.而不用定义该结构体的实例名称.

        Car memory _car = cars[0];
        _car.model;
        _car.year;
        _car.owner;
        //在memory中的变量不可修改

        Car storage _car1 = cars[0];
        _car1.model = "tesla";
        _car1.year = 2008;
        //在storage里的变量,可以修改

        delete _car.owner;
        //所以toyota的string应该是结构体默认值model
        delete cars[2];
        //bmw的三个变量应该都是默认值
    }

}