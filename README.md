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

