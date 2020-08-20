pragma solidity ^0.7.0;
/*
People Array Assignment
Your assignment for today is to make a copy of the Helloworld contract and make a few changes. Make sure to keep your original People contract as well, since we will continue to work on that tomorrow.

- Instead of having a mapping where we store people, create a new array where we can store the people. 
- When someone creates a new person, add the Person object to the people array instead of the mapping.
- Create a public get function where we can input an index and retrieve the Person object with that index in the array.
- Modify the Person struct and  add an address property Creator. Make sure to edit the createPerson function so that it sets this property to the msg.sender.

Bonus Assignments

- Create a new mapping (address to uint) which stores the number of people created by a specific address.
- Modify the createPerson function to set/update this mapping for every new person created.

Bonus Assignment #2 [Difficult]

- Create a function that returns an array of all the ID's that the msg.sender has created.

*/

contract PeopleArrayAssignment {
    struct Person {
        address creator;
        string name;
        uint age;
        uint height;
    }
    
    // Person array stores the persons. The Person array index is the ID
    Person[] people;
    // numberOfPeople made public for debug
    mapping(address => uint) public numberOfPeople;
    
    // createPerson: add a Person to the people array
    function createPerson(string memory name, uint age, uint height) public {
        
        people.push( Person(msg.sender, name, age, height) );
        
        // Or you can do in this way
        /*
        Person memory newPerson;
        newPerson.creator = msg.sender;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
        people.push( newPerson );
        */
        
        // store the number of people created by a specific address
        numberOfPeople[msg.sender] += 1;
        
    }
    
    // getPerson: returns a person from people array by index (ID)
    function getPerson(uint index) public view returns(address creator, string memory name, uint age, uint height) {
        return ( people[index].creator, people[index].name, people[index].age, people[index].height );
    }
    
    // returns an array of all the ID's that the msg.sender has created
    function senderIDs() public view returns(uint[] memory) {
        uint[] memory senderIDsArr = new uint[](numberOfPeople[msg.sender]);
        // j is senderIDsArr index
        uint j = 0;
        
        for(uint i = 0; i < people.length; i++) {
            if(people[i].creator == msg.sender) {
                senderIDsArr[j++] = i;
            }
        }
        
        return (senderIDsArr);
    }
    
}
