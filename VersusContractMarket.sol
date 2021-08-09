pragma solidity ^0.5.5;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol";
import "./VersusGame_Auction.sol";

contract VersusContract is ERC721Full, Ownable {
    constructor() ERC721Full("VersusContract", "VERSUS") public {}
    using Counters for Counters.Counter;
    Counters.Counter token_ids;
    
    address payable public versus_address = msg.sender; //Deployer
    mapping(uint => VersusGame) public games;
    modifier gameRegistered(uint token_id) {
      require(_exists(token_id), "game not registered"); //checks if token exist - refer the docs from openzeppelin 721
      _;//returns to the execution
  }
  function createGame(uint token_id) public onlyOwner {
      games[token_id] = new VersusGame(versus_address); //= deployer's address
  }
  function registerGame(string memory uri) public payable onlyOwner {
      token_ids.increment();
      uint token_id = token_ids.current();
      _mint(versus_address, token_id);
      _setTokenURI(token_id, uri);
      createGame(token_id);
  }
  function endGame (uint token_id) public onlyOwner gameRegistered(token_id) {
      VersusGame game = games[token_id];
      game.gameEnd();
      safeTransferFrom(owner(), game.player(), token_id);
  }
  function gameEnded(uint token_id) public view returns(bool) {
      VersusGame game = games[token_id];
      return game.ended();
  }
  function bet_amount(uint token_id) public view gameRegistered(token_id) returns(uint) {
      VersusGame game = games[token_id];
      return game.bet_value();
  }
//   function pendingReturn(uint token_id, address sender) public view gameRegistered(token_id) returns(uint) {
//       VersusGame game = games[token_id];
//       return game.pendingReturn(sender);
//   }
  function bet(uint token_id) public payable gameRegistered(token_id) {
      VersusGame game = games[token_id];
      game.bet.value(msg.value)(msg.sender);
  }
}