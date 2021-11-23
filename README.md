<img  src="./imagen/Frame.jpg" width="830" height="50" >

*FIRST FAILED attempt at a project without a guide, carried out step by step for Chainlink Fall 2021 Hackathon.*
_Team: [Pinajmr](https://www.linkedin.com/in/pinajmr/) Dev and [Sarap](https://www.linkedin.com/in/sarahrappeneau/) UI & UX. Feel free to make a contribution or correction, beginner project._

# Cerber - The Blockchain Password Manager

#### Cerber is a password manager that uses decentralization and security that only the blockchain can guarantee. Cerber is a site that helps you manage your passwords safely and without having a third party, so that only you have access to them. Passwords will never be lost, no central server is required.

<!-- ![alt text](./image/logo.png "Cerber - The blockchain password manager") -->
### what happened?
While developing and researching to successfully carry out this project for the hackathon, I am running into several problems currently:

* If we chose a public blockchain like ethereum, the data we store would be available to everyone. This is because in a blockchain network, (almost) every participant has a copy of the entire chain. But even if you decided to build our own private chain, every participant would get a copy. The difference here is, that we have control over who is joining the network and gets a copy.

* Most personal or confidential information needs to be deleted at some point. Especially considering the new GDPR. Unfortunately, deleting data from the chain is not possible by design.

### Possible Solution
I was thinking of using an encryption function using the functions provided by Chainlink, but no, the data must be encrypted with encryption keys could be a solution, before entering the contract, so, the contract would work more like a traditional database where it keeps a key-value, this value as a hash.

Or use a traditional backend, an option not included for the same purpose of this application, to protect your security and that only you are the owner of your data.

### so, now ?

Therefore, I have changed the project to use more of the knowledge learned in the workshop, you can see it here.
[NFT Hummans to Mart](https://github.com/pinajmr/NFT-Collectible-Humans.git)