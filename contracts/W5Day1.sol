//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract ToDo { 
    uint public totalTasks = 0;
    mapping(uint => Task) public taskList;

    struct Task {
        uint Id;
        string taskName;
        bool completedYet;
        uint completedTime;
    }

    function createTask(string memory _taskName) public {

        taskList[totalTasks] = Task(totalTasks, _taskName, false, 0);
        totalTasks += 1;

    }

    function toggleTask(uint _index) public {
        taskList[_index].completedYet = !taskList[_index].completedYet;
        taskList[_index].completedTime = taskList[_index].completedYet ? block.timestamp : 0;
    }

}