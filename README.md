# BootcampAssignments

##Week6

- Day 1
People Array Assignment
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


