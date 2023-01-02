// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract AccessControl{
    //创建一个映射roles,byte32-地址-bool,
    //创建2个bytes32类型的变量,其为身份,分别为ADMIN,USER;将他们hash运算得来.
    //创建一个内部函数,输入身份(上面的bytes32类型)和地址,内部函数,映射roles中将其对应为true
    //创建2个事件,分别为grantrole(赋予身份)与revokerole(删除身份)包含bytes32,addres数据类型,包含indexed关键字,该事件在运行内部赋予身份函数时触发
    //创建一个外部函数,可运行刚才创建的内部函数
    //创建一个修改器,设置消息发送者需要为ADMIN身份
    //创建一个构造函数,给予msg.sender ADMIN身份,通过内部函数.
    //创建一个外部函数,可以删除身份,同时触发事件

    mapping(bytes32 => mapping (address => bool)) public roles;

    bytes32 public ADMIN = keccak256(abi.encodePacked("ADMIN"));
    //0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 public USER = keccak256(abi.encodePacked("USER"));
    //0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96

    event GrantRole (bytes32 indexed role,address indexed add);
    event RevokeRole (bytes32 indexed role,address indexed add);

    constructor() {
        _grantRole(ADMIN,msg.sender);
    }

    modifier onlyRole(bytes32 _role) {
       require(roles[_role][msg.sender], "not authorized");
       _;
    }

    function _grantRole(bytes32 _role,address _add ) internal {
        roles[_role][_add] = true ;
        emit GrantRole(_role,_add); 
    }

    function grantRole(bytes32 _role,address _add ) external onlyRole(ADMIN) {
        _grantRole(_role,_add);
    }

    function revokeRole(bytes32 _role,address _add ) external onlyRole(ADMIN) {
        roles[_role][_add] = false ;    
    }

}