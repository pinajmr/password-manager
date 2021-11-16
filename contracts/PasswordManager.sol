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
  
  uint private s_id;
  
  mapping(uint => Account) accounts;
  
  
  
  //Account[] private accounts;


  function setData(uint id ,string memory _username, string memory _password) public  {
      //accounts.push(Account({s_owner : msg.sender, s_username : _username,s_password : _password}));
      s_id = id;
      if (id != 0){
        accounts[s_id].s_owner = msg.sender;
        accounts[s_id].s_username = _username;
        accounts[s_id].s_password = _password;
      } else {
          revert("You have a error");
      }

      
    //   emit SetAccount(msg.sender);
  }

  function getData(uint id) public view  returns (string memory ,string memory) {
    require(accounts[id].s_owner == msg.sender, "You not are the owner");
    return (accounts[id].s_username, accounts[id].s_password);
  }
}
