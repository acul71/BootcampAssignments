// SPDX-License-Identifier: GPL-3.0
import "Ownable.sol";
pragma solidity ^0.7.0;

contract Destroyable is Ownable {
    function close() public onlyOwner { //onlyOwner is custom modifier
        selfdestruct(msg.sender);  // `owner` is the owners address
    }
}
