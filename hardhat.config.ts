import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";
import "dotenv/config";
import "hardhat-typechain";
import { HardhatUserConfig } from "hardhat/types";

// const HDWalletProvider = require('@truffle/hdwallet-provider');
// const provider = new HDWalletProvider({ 
//   privateKeys:[process.env.PK]
//   // ,providerOrUrl:'http://192.168.1.183:20000'}
//   ,providerOrUrl:'https://public-node-api.klaytnapi.com/v1/cypress'}
//   )

const config: HardhatUserConfig = {
  solidity: {
    version: "0.5.6",
  },
  networks: {
    // kovan: {
    //   url: `https://kovan.infura.io/v3/${process.env.INFURA_API_KEY}`,
    //   accounts: [process.env.ADMIN || ''],
    //   chainId: 42,
    // },
    // ceik: { provider: () => provider, chainId: 8217, },
    // kovan: {
    //   url: `https://public-node-api.klaytnapi.com/v1/cypress`,
    //   accounts: [process.env.PK || ''],
    //   chainId: 8217,
    // },
    klay: {
      url: `https://public-node-api.klaytnapi.com/v1/cypress`,
      accounts: [process.env.PK || ''],
      chainId: 8217,
    },
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  },
};

export default config;
