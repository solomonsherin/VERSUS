## VERSUS: Creating a sports betting platform (NBA) on solidity by leveraging Martian Auction and Martian Market as base codes!


![ETHBasketball](Images/ETH_Basketball.png)
(Image by kongvector)



***Setup/Libraries used or Adapted***
    
- Solidity : An object-oriented, high-level language for implementing smart contracts
    
- Truffle : Development environment for sports betting dApp
    
- MetaMask: Cryptocurrency wallet that interacts with dApp and used to create holding of ether and bet fundings and confirm transfers
   
- Ganache: Account info of players and contract owners including their addresses, transactions, and balances
 
- OpenZeppelin: A library for secure smart contract development which features a stable API, which means your contracts won't break unexpectedly when upgrading to a newer minor version                                                     
   - OpenZeppelin's ownable contract : https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol
   - OpenZeppelin's ERC721: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol



### Player 1 VERSUS Player 2: A Basketball Betting Game

***How it works***

- Players are incentivized to act on behalf of their own self-interest.
- Players have enough ether in their wallet to participate in betting contract
- Facilitator/VERSUS makes ethical decision purely based on game result
- Betting odds 1:1 in an NBA game due to win/loss nature [no tie]
- Player 1 initiates the bet choosing his odds and placing a bet value. A Token ID is then created
- Player 2 joins the bet/contract with a minimum requirement of matching the bet value and a separate TokenID is created for the second player
- When the registered game ends, the bet amount is then transferred to the winner

### **[VERSUS GAME AUCTION](https://github.com/solomonsherin/VERSUS/blob/main/VersusGame_Auction.sol)**

This contract sets the parameters and creates the variables for the transfers to take place.


### **[VERSUS CONTRACT MARKET](https://github.com/solomonsherin/VERSUS/blob/main/VersusContractMarket.sol)**

This contract is dependent on Versus Game Auction to map the address, create a game, register the game and transfer the bet amount to the winner when the game ends.


## DEPLOY AND RUN TRANSACTIONS:
* **[SCREENSHOTS](https://github.com/solomonsherin/VERSUS/tree/main/Deploy%20and%20Run%20Transactions%20Screenshots)**

### Sources:

- https://xhe3.medium.com/taking-a-bet-with-the-blockchain-64b52352a3c9
- https://rapidapi.com/blog/sports-betting-app-python/
- https://medium.com/analytics-vidhya/intro-to-scraping-basketball-reference-data-8adcaa79664a
- https://github.com/vishaalagartha/basketball_reference_scraper
- https://medium.com/coinmonks/tutorial-create-a-sports-betting-dapp-on-the-ethereum-blockchain-part-2-cd4753afe702 

### Collaborators

* **[Coney Dacanay]()**
* **[Jason Wang](https://github.com/enabledisruptor)**
* **[Kaining Liu](https://github.com/hanson0629)**
* **[Michael Nitchov]()** 
* **[Sherin Solomon](https://github.com/solomonsherin)**
* **[Simran Saini](https://github.com/simran1407)**

