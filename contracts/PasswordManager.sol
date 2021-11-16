//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


import "@openzeppelin/contracts/access/Ownable.sol"; 


contract PasswordManager is Ownable{

  event SetAccount(address sender);
  
  struct Account {
    string s_username;
    string s_password;
  }
  
  mapping(string => Account) accounts;
  
  function setData(string memory url ,string memory _username, string memory _password) public  onlyOwner {
     
      accounts[url].s_username = _username;
      accounts[url].s_password = _password;
    
      
    //emit SetAccount(msg.sender);
  }

  function getData(string memory url) public view onlyOwner returns (string memory ,string memory) {
    return (accounts[url].s_username, accounts[url].s_password);
  }
}
