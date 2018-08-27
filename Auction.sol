pragma solidity ^0.4.0;

contract Auction {
    
    
    uint public deployementTime;
    address public beneficiary;
    string private password; // note: it's not a secure way to share passwords on the blockChain, even if its access modifier is private, is not is really private on the blockchain.
// we just added it here to make our idea of assets clear because you don't know tokenization concept yet.  

    
    mapping(address => bool) access; // declare a mapping to store given access for the winnwe address
    uint public max =0; // declare a variable to store the maximum value.
    address public maxAddress; // declare a variable to store the address of the maximum value


    constructor (string asset, address owner) public {
        deployementTime = now;
        beneficiary = owner;
        password = asset;
        maxAddress = owner; // initialize the maxAddress.
    }
    

    // build bid() function
    
    // build a payable function, so the bidder can send the value he wants.
    function bid() public payable{
        require(now < deployementTime + 180 minutes); // determine the duration of the auction .
        if(msg.value > max){
            maxAddress.transfer(max); // return the money to the previous maxAddress. 
            max = msg.value; // assign the new max value
            maxAddress = msg.sender; // assign the new maxAddress
            
        } else {
            msg.sender.transfer(msg.value); // return the money to the sender.
        }
    }



    // build showMax() function
    
    function showMax() public view returns (uint, address) {
        // return last assigned values to max and maxAddress
        return (max, maxAddress);
    }
    
    

    // build sellAsset() function
    function sellAsset() public {
        require(now > deployementTime +180 minutes); // make sure that the auction ends.
        require(msg.sender == beneficiary); // make sure that the sender is the owner .
        access[maxAddress] =true;  // give an access to the winner.
        beneficiary.transfer(this.balance); // give the owner the money
    }



    // build getAsset() function
    function getAsset() public view returns (string){
        require(access[msg.sender]); // make sure that the sender is the winner and he has an access.
        return password; // return the asset
    }
    
    
}