// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创建结构体,包含待办事项和是否完成
//创建结构体数组,用来储存备忘录
//输入待办事项的函数
//修改待办事项的函数
//获取待办事项的函数
//修改待办事项是否完成的函数

contract todoContract {
    struct Todo {
        string things;
        bool completed;
    }

    Todo[] public todos;

    function createTodo(string calldata _things) external {
        todos.push(Todo({things: _things, completed: false}));
    }

    function updateTodo(uint _index, string calldata _things) external {
        todos[_index].things = _things;
    }

    function get(uint _index) external view returns (string memory, bool){
        Todo storage todo = todos[_index];//此处用storage比memory节省gas
        return (todo.things, todo.completed);
    }

    function changeCom(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}