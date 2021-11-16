//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


import "@openzeppelin/contracts/access/Ownable.sol"; 
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract PasswordManager is Ownable, VRFConsumerBase {

  bytes32 internal keyHash;
  uint256 internal fee;
    
  uint256 public randomResult;
  
  struct Account {
    string s_username;
    string s_password;
  }
  
  mapping(string => Account) accounts;
  
  constructor() 
    VRFConsumerBase(
        0xdD3782915140c8f3b190B5D67eAc6dc5760C46E9, // VRF Coordinator
        0xa36085F69e2889c224210F603D836748e7dC0088  // LINK Token
        )
    {
        keyHash = 0x6c3699283bda56ad74f6b855546325b68d482e983852a7a82979cc4807b641f4;
        fee = 0.1 * 10 ** 18; // 0.1 LINK (Varies by network)
    }
  
  event SetAccount(address sender);
  
  function setData(string memory url ,string memory _username, string memory _password) public  onlyOwner {
     
      accounts[url].s_username = _username;
      accounts[url].s_password = _password;
    
      
    //emit SetAccount(msg.sender);
  }

  function getData(string memory url) public view onlyOwner returns (string memory ,string memory) {
    return (accounts[url].s_username, accounts[url].s_password);
  }
  
//   function deterministicPseudoRandom(string memory url, string memory _username, string memory _password) public pure returns( uint256) {
//     bytes memory encodedParams = abi.encodePacked(url,_username,_password);
//     bytes32 hashedParams = keccak256(encodedParams);
    
//     return uint256(hashedParams);
//   }
  
  function getRandomNumber() public returns (bytes32 requestId) {
    require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
    return requestRandomness(keyHash, fee);
  }


  function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
    randomResult = randomness;
  }

}
