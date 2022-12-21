//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract AttendanceRegister {

    struct Student{
        string name;
        uint class;
        uint joiningDate;
    }

    address public teacher;
    uint rollNumber;

    event Added(string name, uint class, uint time);

    mapping(uint => Student) public register; // roll number => student details

    modifier isTeacher {
        require(msg.sender == teacher, "Only teacher can add student");
        _;
    }

    /*
     * @dev Constructor
     */
    constructor() {
        teacher = msg.sender;
    }


    /*
     * @dev Add student into attendance register
     * @param name Student name
     * @param class Student class
     * @param joiningDate Student joining date
     */
    function add(string memory name, uint class) public isTeacher {
        require(class > 0 && class <= 12, "Invalid class");
        uint joinDate = block.timestamp;
        Student memory s = Student(name, class, joinDate);
        rollNumber++;
        register[rollNumber] = s;
        emit Added(name, class, joinDate);
    }
}

contract AttendanceRegisterExtended is AttendanceRegister {

    function getStudentDetails(uint _rollNumber) public view returns(Student memory) {
        return register[_rollNumber];
    }

}