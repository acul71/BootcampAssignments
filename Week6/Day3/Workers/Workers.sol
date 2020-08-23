// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;
import "People.sol";

/*
Inheritance Assignment
Today's assignment will focus on Inheritance. 
We will create a new contract that will extend the functionality of our HelloWorld contract. 
Therefore, to complete this assignment, we should make no changes to the Base aka 
HelloWorld Contract (except one small exception).

What we are creating today is not a very useful application, 
but it is a good assignment on Inheritance. 
You will learn about better ways to store unique information on the blockchain further down the curriculum.

For clarity, start by renaming your contract from HelloWorld to People. 
You can also disregard our External.sol file, we won't be using it anymore. 

Then, create a file with new contract called Workers, which should inherit from People. 
Then implement the functionality listed below. 
When you are done. Hand in a link to your code to Google Classroom for the Inheritance Assignment.

The Workers-contract should have the following functions and properties:

- Should inherit from the People Contract. 
- Should extend the People contract by adding another mapping called salary 
  which maps an address to an integer. 
- Have a createWorker function which is a wrapper function for the createPerson function. 
  Make sure to figure out the correct visibility level for the createPerson function 
  (it should no longer be public). 
  This is the only modification we should do in the People contract.
- Apart from calling the createPerson function, the createWorker function should also 
  set the salary for the Worker in the new mapping.
- When creating a worker, the persons age should not be allowed to be over 75. 
- Implement a fire function, which removes the worker from the contract.

*/

// Simple Workers contract no bonus
contract Workers is People {
   mapping(address => uint) salary;

   function createWorker(string memory name, uint age, uint height, uint wage) public {
      require(age <= 75, "Worker age should not be over 75");

      createPerson(name, age, height);
      salary[msg.sender] = wage;
   }

   function fireWorker() public {
      deletePerson(msg.sender);
      delete salary[msg.sender];
   }
}