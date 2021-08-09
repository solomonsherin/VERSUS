pragma solidity ^0.5.5;

contract VersusGame {
    
    address public deployer;
    address payable public winner; //previous: beneficiary
    address public player; 
    uint public bet_value;
    
    //Allow withdrawals of bids
    // mapping(address => uint) pendingReturns;
    
    // By default is `false`.
    bool public ended;
    
    // Create events that will be emitted on changes.
    event BetPlaced(address player, uint bet_value); //log of bids - HighestBidIncreased
    event gameEnded(address winner, uint bet_value);

    constructor(
        address payable _winner) public {  // underscore = special function to protect the name from other items
        deployer = msg.sender; // set as the MartianMarket
        winner = _winner; 
    }
    
    //The value will be refunded if the auction is not won.
    function bet(address payable sender) public payable{  
    // To save gas, return money if the bid is not higher.
        require(
            msg.value == bet_value,
            "The bet value needs to be the same."
        );

        require(!ended, "gameEnd has already been called.");

        // if (bet_value != 0) {
        //     pendingReturns[player] += bet_value;
        // }
        player = sender;
        bet_value = msg.value;
        emit BetPlaced(sender, msg.value);
    }
    
    //To end the bet and send the money to the beneficiary
    function gameEnd() public {
    
    //1. Conditions    
        require(!ended, "gameEnd has already been called.");
        require(msg.sender == deployer, "You are not the auction deployer!");

    // 2. Effects
        ended = true;
        
        emit gameEnded(winner, bet_value);

    // 3. Interaction
        winner.transfer(bet_value);

    }
}