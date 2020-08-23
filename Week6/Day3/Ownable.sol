pragma solidity 0.5.12;

contract Ownable {
    address internal owner;
    
    constructor() public {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner);
        _; // Continue execution
    }
}