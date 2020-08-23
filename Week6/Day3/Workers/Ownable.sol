// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Ownable {
    address internal owner;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _; // Continue execution
    }
}
