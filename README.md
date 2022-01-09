# injeolmi-price-contracts
인절미 가격 가져오는 스마트 계약

## Mainnet
- CeikPrice: [0x6E22cd771d0BBC18501F3113e01fD95947299Ca1](https://scope.klaytn.com/account/0x6E22cd771d0BBC18501F3113e01fD95947299Ca1)

- CeikPrice: [0x17e10666cF781C353fCf23464260fd450638Bb99](https://scope.klaytn.com/account/0x17e10666cF781C353fCf23464260fd450638Bb99)

2022-01-09
yarn add --dev hardhat
yarn add --dev hardhat-deploy dotenv

https://tech.elysia.land/hardhat-plugin-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0-hardhat-deploy-typechain-108d8231e87a
.env 파일 설정은 아래와 같이 진행한다. 
각각의 API Key에 대한 구체적인 설명은 이전 게시글에 나타나 있다.
ETHERSCAN_API_KEY= etherscan api key 
INFURA_API_KEY= infura api key 
ADMIN= admin account private key 
DEPOSITOR= depositor account private key

yarn hardhat compile

tsconfig.json --> 
Contract deploy — Script
배포 스크립트가 위치한 폴더로 script 대신 deploy 를 사용할 것이므로, 
tsconfig.json 파일에서 include 옵션을 script 대신 deploy 로 변경해준다.

<!-- yarn hardhat deploy --network ropsten
yarn hardhat deploy --network kovan -->
yarn hardhat compile --network klay

wCeik.sol --> 기존 인절미 카피코인 wCeik

18 내 인생은 항상 줘도 못먹지...
하드햇 어케 배포 하는거얌?