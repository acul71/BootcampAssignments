pragma solidity 0.7.0;
/*

In today's assignment, I want you to add some extra functionality to our Helloworld contract. 
I want you to use the original contract that I use in the videos, 
not the modified one you created in the assignment yesterday.

- Implement a function or functions so that the people in the mapping can update their information. 
  Make sure to use the correct data location so that the update is saved. 
  This function should use assert to verify that the changes have taken place.

- Create an event called PersonUpdated that is emitted when a persons information is updated. 
  The event should contain both the old and the updated information of the person. 

*/

contract HelloWorld{

    struct Person {
      //uint id;
      string name;
      uint age;
      uint height;
    }

    mapping (address => Person) private people;

    event PersonUpdated(string nameOld, uint ageOld, uint heightOld, string nameUpdated, uint ageUpdated, uint heightUpdated);

    function createPerson(string memory name, uint age, uint height) public {
        address creator = msg.sender;
        bytes memory tempEmptyStringTest = bytes(name);

        require(tempEmptyStringTest.length > 0, "name can't be empty");

        //This creates a person
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;

        people[creator] = newPerson;
    }

    function getPerson() public view returns(string memory name, uint age, uint height){
        address creator = msg.sender;
        return (people[creator].name, people[creator].age, people[creator].height);
    }

    function updatePerson(string memory name, uint age, uint height) public {
        address creator = msg.sender;

        bytes memory tempEmptyStringTest = bytes(people[creator].name);
        require(tempEmptyStringTest.length > 0, "Can't update: person doesn't exist");

        tempEmptyStringTest = bytes(name);
        require(tempEmptyStringTest.length > 0, "name can't be empty");

        Person memory oldPerson;
        oldPerson = people[creator];

        people[creator].name = name;
        people[creator].age = age;
        people[creator].height = height;

        assert(
            keccak256(
                abi.encodePacked(
                    people[creator].name, 
                    people[creator].age, 
                    people[creator].height
                )
            ) 
            == 
            keccak256(
                abi.encodePacked(
                    name, 
                    age, 
                    height
                )
            ) 
        );

        emit PersonUpdated(oldPerson.name, oldPerson.age, oldPerson.height, name, age, height);
    }
}
