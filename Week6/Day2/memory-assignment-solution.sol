pragma solidity 0.7.0;

/*
Hi. I had to change pragma solidity >= 0.5.12 otherwise with google-chrome it won’t compile.
To differentiate addUser and updateBalance I added some constraint.
*/

contract MemoryAndStorage {

   mapping(uint => User) users;

   struct User{
      uint id;
      uint balance;
   }


   modifier newUser(uint id) {
      require( id > 0, "User id must be > 0" );
      require( id != users[id].id, "User id is already used" );
      _;
   }

   modifier userMustExist(uint id) {
      require( id > 0, "User id must be > 0" );
      require( id == users[id].id, "User doesn't exist" );
      _;
   }


   function addUser(uint id, uint balance) public newUser(id) {
      users[id] = User(id, balance);
   }

   function updateBalance(uint id, uint balance) public userMustExist(id) {
      users[id].balance = balance;
   }

   function getBalance(uint id) view public userMustExist(id) returns (uint) {
      return users[id].balance;
   }
}