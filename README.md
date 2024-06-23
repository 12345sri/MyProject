# Create A Project
Solidity is the main programming language for writing smart contracts for the Ethereum blockchain.

## Description
This contract is written in Solidity language, a programming language used for developing smart contracts on the Ethereum blockchain. This contract have 5 public state variables (addStudent, AllocateNewSeat, updateseatstatus, applyseats and students).Add student means adding student details, Allocate new seat means allocation seat for student if and only if given recurement is fulfilled, otherwise not.Update status means status updation for student only if previous condition is fulfilled.Apply seat will be applicable whos seat allocation is done already and finaly, in Students variable ,student details will be there.In every variable we will put a address and cheak solidity code.

## Getting Started
### Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MyToken.sol). Copy and paste the following code into the file:

```
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile MyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it. Click on the "MyToken" contract in the left-hand sidebar, and then check the token Abbrev, tokenName, total supply by clicking them. By passing address and token value in mintToken and clicking it will call the mintTokens function and same will be with burnTokens.

Authors
Sriporna Biswas https://www.linkedin.com/in/sriporna-biswas-7062a4294/

License
This Create A Project is licensed under the MIT License.
