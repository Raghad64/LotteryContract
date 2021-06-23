pragma solidity ^0.4.18;

contract Lottery {
    
    mapping (address => uint256) public winnings;
    //This variable holds the addresses of tickets purchasers. while the index is considered as the ticket's number
    address[] public tickets;

    string public name;
    string public symbol;
    uint256 public maxTickets;
    uint256 public remTickets;
    uint public totalTickets;
    uint256 public RandomNumber;
    address public latestWinner;
    
    //This constructor is for setting the token on the Ethereum network
    //TODO: set name, symbol, maxTickets, remTickets values to take the values of constructor's variables 
    constructor(string tokenName, string tokenSymbol, uint maximumTickets, uint remainingTickets) 
    public {
        
        //Place your code here
        
    }
    
    // This function is for whom ever wishes to buy a lottery ticket where tickets price are set and each purchase's address
    // is stored in the tickets array. 
    // TODO: Here, the ticket's price is set for you. All you need to do is to push the purchaser's address to the ticket's array.
    // TODO: Also, make sure the totalTickets counter is counting the number of tickets purchased by changing its value. 
    function BuyTickets() public payable {
        
        require(msg.value == 1000000000000000000);
        
        uint256 val = msg.value / 1000000000000000000;
        
        require(remTickets - val < remTickets);
        remTickets -= val;
        
        //Place your code here
        
    } 
    
    /*This function is basically for choosing the winner.
     To select a winner, the contract generates a random number by taking the current block number, 
     Subtracting 1 and running it through the block hash function to get a number which we converted to an integer.
     This integer is multiplied by the ticket count to ensure that it falls within the range of the number of tickets purchased,
     and determines the winner from the array.
     Once a winner is chosen, all of the lottery proceeds are assigned to the address corresponding to the lottery winner. */

    //TODO: Write the code responsible for choosing a random winner and stores the winner's address in the latest winner variable.
    //TODO: Assign all the proceeds to the winner's address. 
    //TODO: Reset the total number of tickets into 0. 
    function pickWinner() public {
        require(totalTickets > 0);
        RandomNumber = uint(blockhash(block.number -1)) % totalTickets;
        //Place your code here
        remTickets = maxTickets;
        
        delete tickets;
    }
    
    /*The withdraw function verifies that the address of the person trying to withdraw funds matches the winner, 
    allows them to withdraw their winnings in ether, and then resets their balance to 0 so they can't withdraw more than once.*/

    //TODO: Transfer the amount the winner can withdraw 
    function takeWinnings() public {
        require(winnings[msg.sender] > 0);
        uint256 amountToWithdraw = winnings[msg.sender];
        winnings[msg.sender] = 0;
        amountToWithdraw *= 1000000000000000000;
        //Place your code here
    }
    
    
}
