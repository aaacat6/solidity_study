// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

interface IERC20 {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipent,uint amount) external returns (bool);

    function allowance(address owner,address spender) external view returns (uint);

    function approve(address spender,uint amount) external returns (bool);

    function transferFrom(address sender,address recipient,uint amount) external returns (bool);

    event Transfer(address indexed from,address indexed to,uint amount);

    event Approval(address indexed owner,address indexed spender,uint amount);
}

contract ERC20 is IERC20 {
//设置一个uint变量,为totalSupply.
//设置一个address-uint账本,为balanceOf.
//设置一个allowance账本,address-(address-uint),为allowance.
//设置name,symbol,decimals(精度,一般为18).
//设置一个函数,实现一个账户像另外一个账户授权,并释放授权事件.
//设置一个函数,实现transfer,主要为balanceOf映射账本的加减,同时释放transfer事件,返回true.
//设置一个函数,实现trasferFrom,需要从allowance 减去 msg.sender对应的数量,同时释放transfer事件,返回true.
//设置一个函数.给予msg.sender一定的代币数额(映射账本),同时释放transfer事件,从address(0)发出.
//设置一个销毁代币的函数,既totalSupply减少,msg.sender账本数量减少,释放transfer事件,发入transfer(0).

uint public override  totalSupply;
mapping(address => uint) public override  balanceOf;
mapping(address => mapping(address => uint))public override  allowance;
string public name = "0X";
string public symbol = "0X";
uint public decimals = 18;

function transfer(address recipient,uint amount) external override  returns(bool) {
    balanceOf[msg.sender] -= amount;
    balanceOf[recipient] += amount;
    emit Transfer(msg.sender,recipient,amount);
    return true;
}

function approve(address spender,uint amount) external override  returns(bool) {
    allowance[msg.sender][spender] += amount;
    emit Approval(msg.sender,spender,amount);
    return true;
}

function transferFrom(address sender,address recipient,uint amount) external override  returns(bool) {
    allowance[msg.sender][sender] -= amount;
    balanceOf[sender] -= amount;
    balanceOf[recipient] += amount;
    emit Transfer(sender,recipient,amount);
    return true;
}

function _mint(uint mint) external {
    balanceOf[msg.sender] += mint;
    totalSupply += mint;
    emit Transfer(msg.sender,address(0),mint);
}

function _burn(uint burn) external {
    balanceOf[msg.sender] -= burn;
    totalSupply -= burn;
    emit Transfer(msg.sender,address(0),burn);
}

}