// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Owned.sol";
import "./Logger.sol";
import "./IFaucet.sol";

contract Faucet is Owned,Logger,IFaucet{
    // This is a special function
    // Called when you make a transaction 
    // that doesn't specify any function name to call

    // External functions are part of the contract interface
    // which means they can be called via contracts and other transactions

// address[] public funders;
    uint public numOfFunders;
    // mapping(uint => address) private funders; // there is duplication of addresses
    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders; 

    

    

    modifier limitWithdraw(uint withdrawAmount){
        require(withdrawAmount <= 100000000000000000,
        "Cannot withdraw more than 0.1 ether");
    _;
    }

    receive() external payable{

    }
    
    function emitLog() public override pure returns(bytes32){
        return "Hello world";

    }


   
  
    function addFunds() external override payable{
        // funders[index]= msg.sender;
        address funder=msg.sender;
        if(!funders[funder]){
            uint index=numOfFunders++;
            funders[funder]=true;
            lutFunders[index]=funder;

        }

    }

     function transferOwnership(address newOwner) external onlyOwner{
        owner=newOwner;
    }

    function withdraw(uint withdrawAmount) external override limitWithdraw(withdrawAmount) {
       
        payable(msg.sender).transfer(withdrawAmount);


    }
   
   function getAllFunders()public view returns(address[] memory){
    address[] memory _funders= new address[](numOfFunders);

    for(uint i=0;i<numOfFunders; i++){
    _funders[i]=lutFunders[i];
    }


    return _funders;

   }

    function getFunderAtIndex(uint8 index) external view returns(address){
        // address[] memory _funders=getAllFunders();
        return lutFunders[index];

    }
    // pure,view - read-only, no gas fees
    // view- indicates the function will not alter the storage state
    // pure- even more strict, indicating that it won't even read the storage state 

    // Transactions - can generate state changes and requires gas fees
}


  // const instance= await Faucet.deployed()
  //  instance.addFunds({from:accounts[0], value:"2000000000000000000"})
  //  instance.addFunds({from:accounts[1], value:"2000000000000000000"})
  //  instance.withdraw("500000000000000000",{from:accounts[0]})
  //  instance.getFunderAtIndex(0)
  //  instance.getAllFunders()