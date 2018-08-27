// Fix the errors in this code . 

pragma solidity ^0.4.0;


contract exercise {

   uint public balance;
   string  name= "Sara";
   int[] public nums=[1,2,3];


   function setBalance(uint x) public {
       balance = x;
       doubleBalance();
   }

   function getBalance() public view returns (uint) {
       return balance;
   }


   function doubleBalance() public returns (uint) {
       balance=2*balance;
       return balance;
   }

   
}