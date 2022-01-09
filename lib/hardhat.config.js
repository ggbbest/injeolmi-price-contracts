"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");
require("dotenv/config");
require("hardhat-typechain");
const config = {
    solidity: {
        version: "0.5.6",
    },
    networks: {
        kovan: {
            url: `https://public-node-api.klaytnapi.com/v1/cypress`,
            accounts: [process.env.PK || ''],
            chainId: 8217,
        },
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
exports.default = config;
//# sourceMappingURL=hardhat.config.js.map