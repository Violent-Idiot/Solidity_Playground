// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Marks {
    address[] studentResults;
    struct student{
        string Name;
        uint8 Marks;
        string Subject;
    }

    mapping (address => student) result;
    function adding_values(address  _token, string memory _name, string memory _subject, uint8  _marks) public {
        student storage Student = result[_token];
        Student.Name = _name;
        Student.Marks = _marks;
        Student.Subject = _subject;
        studentResults.push(_token);
  
    }

     function get_student_result() view public returns (address[] memory) {
        return studentResults;
    }    

}