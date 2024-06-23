// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // public variables to store token details
    string public tokenName = "PHENIX";
    string public tokenAbbrv = "PETRONIX";
    uint public totalSupply = 0;

    // mapping variable of addresses to balances
    mapping (address =>  uint) public balances;

    // mint function to takes two parameters
   function mint(address _to, uint _value) public {
        totalSupply += _value;
        balances[_to] += _value;
    }
    // burn function to distroy token
   function burn(address _from, uint _value) public {
        require(balances[_from] >= _value, "Insufficient balance to burn");
        totalSupply -= _value;
        balances[_from] -= _value;
    }

}


/* 
Few addresses for testing burn, mint and balances
 0x2675875c94bdD0dcB23Ac5e378ffDEFF2cb18Ae6
 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
 7bRzk4C9GrgmpwsNeKm9zUcPB1QmUKp7AbHunRr7fKtU
 0x76d341B001614EADa413E111C73E55d62844D5D5
*/


 
