// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract admission {
    // Student who got under 75% will not be allowed.
    enum board { Dhaka,jossore,Cumlla,Sylhet} 

// Creating a structure to keep data of student.
    struct student {
        string name;
        uint mark;
        uint phoneNo;
        board examinationBoard;
        bool isHavingrequiredmark;
    }

    // Mapping of student struct with address.
    mapping(address => student) public students;

    // Function to add a new student
    function addStudent(
        address _studentAddress,
        string memory _name,
        uint _mark,
        uint _phoneNo,
        board _examinationBoard,
        bool _isHavingrequiredmark
    ) public {
        students[_studentAddress] = student({
            name: _name,
            mark: _mark,
            phoneNo: _phoneNo,
            examinationBoard: _examinationBoard,
            isHavingrequiredmark: _isHavingrequiredmark
        });
    }

// Function to allocate a new seat only if mark is higher than 75
    function allocateNewSeat(address _studentAddress) public returns (bool) {
        // Using required error handling if mark falls below 75.
        require(students[_studentAddress].mark > 75, "Under required mark, application is rejected");
        students[_studentAddress].isHavingrequiredmark = true;
        return true;
    }

    // Function to update seat status
    function updateseatstatus(address _studentAddress, uint _newPhoneNo) public returns (student memory, string memory) {
        if (!students[_studentAddress].isHavingrequiredmark) {
            revert("No existing seat status to update, first allocate a new one");
        }
        students[_studentAddress].phoneNo = _newPhoneNo;
        return (students[_studentAddress], "Status updated");
    }

    // Function to apply for a seat
    function applyseat(address _studentAddress) public view returns (string memory) {
        if (!students[_studentAddress].isHavingrequiredmark) {
            revert("No existing seat status to update, first allocate a new one");
        }

        assert(
            students[_studentAddress].examinationBoard == board.Dhaka ||
            students[_studentAddress].examinationBoard == board.Sylhet
        );
        return ("Seat allocation successful");
    }
}
