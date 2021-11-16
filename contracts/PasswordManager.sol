//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


//import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract PasswordManager {

  event SetAccount(address sender);

  
  
  struct Account {
    address s_owner;
    string s_username;
    string s_password;
  }
  
  //string private url;
  
  mapping(string => Account) accounts;
  
  
  
  //Account[] private accounts;


  function setData(string memory url ,string memory _username, string memory _password) public  {
      //accounts.push(Account({s_owner : msg.sender, s_username : _username,s_password : _password}));
     
      accounts[url].s_owner = msg.sender;
      accounts[url].s_username = _username;
      accounts[url].s_password = _password;
    
      
    //   emit SetAccount(msg.sender);
  }

  function getData(string memory url) public view  returns (string memory ,string memory) {
    require(accounts[url].s_owner == msg.sender, "You not are the owner");
    return (accounts[url].s_username, accounts[url].s_password);
  }
}
