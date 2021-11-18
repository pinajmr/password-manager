require("@nomiclabs/hardhat-waffle");
require('dotenv').config()

const KOVAN_RPC_URL = process.env.KOVAN_RPC_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

module.exports = {
  solidity: "0.8.4",
  networks: {
    kovan: {
      url:`https://kovan.infura.io/v3/${KOVAN_RPC_URL}`,
      accounts:[PRIVATE_KEY]
    }
  }
};