# BootcampAssignments

## Week6

* ### Day 1

**People Array Assignment**

Your assignment for today is to make a copy of the Helloworld contract and make a few changes. Make sure to keep your original People contract as well, since we will continue to work on that tomorrow.

Instead of having a mapping where we store people, create a new array where we can store the people. 
When someone creates a new person, add the Person object to the people array instead of the mapping.
Create a public get function where we can input an index and retrieve the Person object with that index in the array.
Modify the Person struct and  add an address property Creator. Make sure to edit the createPerson function so that it sets this property to the msg.sender.
Bonus Assignments

Create a new mapping (address to uint) which stores the number of people created by a specific address.
Modify the createPerson function to set/update this mapping for every new person created.
Bonus Assignment #2 [Difficult]

Create a function that returns an array of all the ID's that the msg.sender has created.

* ### Day 2

**Data Location Assignment**

Try to solve the issue with the “updateBalance” function.
Propose a solution to the issue.
(There are multiple solutions.)

**People Update Assignment**

In today's assignment, I want you to add some extra functionality to our Helloworld contract. I want you to use the original contract that I use in the videos, not the modified one you created in the assignment yesterday.

* Implement a function or functions so that the people in the mapping can update their information. Make sure to use the correct data location so that the update is saved. This function should use assert to verify that the changes have taken place.
* Create an event called PersonUpdated that is emitted when a persons information is updated. The event should contain both the old and the updated information of the person. 



* ### Day 3

**Destroyable**

Make HelloWorld contract destroyable


**Inheritance Assignment**

Today's assignment will focus on Inheritance. We will create a new contract that will extend the functionality of our HelloWorld contract. Therefore, to complete this assignment, we should make no changes to the Base aka HelloWorld Contract (except one small exception).

What we are creating today is not a very useful application, but it is a good assignment on Inheritance. You will learn about better ways to store unique information on the blockchain further down the curriculum.

For clarity, start by renaming your contract from HelloWorld to People. You can also disregard our External.sol file, we won't be using it anymore. 

Then, create a file with new contract called Workers, which should inherit from People. Then implement the functionality listed below. When you are done. Hand in a link to your code to Google Classroom for the Inheritance Assignment.

The Workers-contract should have the following functions and properties:

* Should inherit from the People Contract. 
* Should extend the People contract by adding another mapping called salary which maps an address to an integer. 
* Have a createWorker function which is a wrapper function for the createPerson function. Make sure to figure out the correct visibility level for the createPerson function (it should no longer be public). This is the only modification we should do in the People contract.
* Apart from calling the createPerson function, the createWorker function should also set the salary for the Worker in the new mapping.
* When creating a worker, the persons age should not be allowed to be over 75. 
* Implement a fire function, which removes the worker from the contract.

Bonus Assignment

* Make sure that a worker can only be fired by his/her boss. For each worker created, you need to input and save information about who (which address) is the boss. This should be implemented in the Worker contract.
* A worker is not allowed to be his/her own boss. 
* By implementing a new function in the base contract, used by both deletePerson and fire, make sure there is as little code duplication as possible between the deletePerson function and the fire function. 



* ### Day 4

**ERC20 assignment**

* make basic ERC20 token contract



