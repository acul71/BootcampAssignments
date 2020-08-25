// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;
import "Ownable.sol";

contract ERC20 is Ownable {

   string private _name;
   string private _symbol;
   uint8 private _decimals;

   uint256 private _totalSupply;

   mapping(address => uint256) private _balances;

   event Transfer(address indexed _from, address indexed _to, uint256 _value);

   constructor(string memory name, string memory symbol, uint8 decimals) {
      _name = name;
      _symbol = symbol;
      _decimals = decimals;
   }

   function name() public view returns (string memory) {
      return _name;
   }

   function symbol() public view returns (string memory) {
      return _symbol;
   }

   function decimals() public view returns (uint8) {
      return _decimals;
   }

   function totalSupply() public view returns (uint256) {
      return _totalSupply;
   }

   function balanceOf(address account) public view returns (uint256) {
      return _balances[account];
   }

   // A token contract which creates new tokens SHOULD trigger a Transfer event 
   // with the _from address set to 0x0 when tokens are created.
   function mint(address account, uint256 amount) public onlyOwner {
      _balances[account] += amount;
      _totalSupply += amount;
      emit Transfer(address(0), account, amount);
   }

   // Transfers amount of tokens to address recipient, and MUST fire the Transfer event. 
   // The function SHOULD throw (with require now) if the message caller’s account balance 
   // does not have enough tokens to spend.
   function transfer(address recipient, uint256 amount) public returns (bool) {
      require(_balances[msg.sender] >= amount); 
      //uint256 memory senderOrigBalance = _balances[msg.sender];
      _balances[msg.sender] -= amount;
      //uint256 memory recipientOrigBalance = _balances[recipient];
      _balances[recipient] += amount;
      //assert(_balances[msg.sender] == senderOrigBalance - amount && _balances[recipient] == recipientOrigBalance + amount);
      emit Transfer(msg.sender, recipient, amount);
      return true;
   }



}