import "Ownable.sol";
import "Destroyable.sol";
pragma solidity 0.5.12;

contract Mapping is Ownable, Destroyable {
   
    struct Person {
        //uint id;
        string name;
        uint age;
        uint height;
        bool senior;
        //address walletAddress;
    }
    
    event personCreated(string name, bool senior);
    event personDeleted(string name, bool senior, address deletedBy);
    
    
    

    
    modifier costs(uint cost) {
        require(msg.value >= cost);
        _;
    }
    

    
    
    
    //Person[] public people;
    mapping(address => Person) private people; 
    
    address[] private creators;
    
    uint private balance;
    
    function getBalance() public view onlyOwner returns(uint) {
        return balance;
    }
    
    function withdrawAll() public onlyOwner returns (uint) {
        uint toTransfer = balance;
        balance = 0;
        msg.sender.transfer(toTransfer);
        return toTransfer;
        
    }
    
    // withdrawAll with send 
    function AlternativeWithdrawAll() public onlyOwner returns (uint) {
        uint toTransfer = balance;
        balance = 0;
        if(msg.sender.send(toTransfer)) {
            return toTransfer;
        } else {
            balance = toTransfer;
            return 0;
        }
    }
    
    
    function createPerson(string memory name, uint age, uint height) public payable costs(100 wei) {
        
        require(age < 150, "age needs to be below 150!");
        // Check if payment >= 1 ether
        //require(msg.value >=1 ether);
        
        
        
        
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
        
        if(age > 65) {
            newPerson.senior = true;
        } else {
            newPerson.senior = false;
        }
        
        insertPerson(newPerson);
        creators.push(msg.sender);
        // Invariance
        // people[msg.sender] == newPerson
        assert(
            keccak256(
                abi.encodePacked(
                    people[msg.sender].name, 
                    people[msg.sender].age, 
                    people[msg.sender].height, 
                    people[msg.sender].senior
                )
            ) 
            == 
            keccak256(
                abi.encodePacked(
                    newPerson.name, 
                    newPerson.age, 
                    newPerson.height, 
                    newPerson.senior
                )
            ) 
        );
        
        emit personCreated(newPerson.name, newPerson.senior);
        balance += msg.value;
        
    }
    
    function insertPerson(Person memory newPerson) private {
        address creator = msg.sender;
        //address payable test = address(uint160(creator));
        people[creator] = newPerson;
    }
    
    function getPerson() public view returns(string memory name, uint age, uint height, bool senior) {
        return (people[msg.sender].name, people[msg.sender].age, people[msg.sender].height, people[msg.sender].senior );
    }
    
    function deletePerson(address creator) public onlyOwner {
        //require(msg.sender == owner, "Caller needs to be owner");
        string memory name = people[creator].name;
        bool senior = people[creator].senior;
        
        delete people[creator];
        // Invariance
        // people[creator].age == 0
        assert( people[creator].age == 0 );
        emit personDeleted(name,senior,creator);
        //emit personDeleted(name, senior, owner);
    }
    
    function getCreator(uint index) public view onlyOwner returns(address) {
        //require(msg.sender == owner, "Caller needs to be owner");
        return creators[index];
    }
 
}

