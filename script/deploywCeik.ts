import hardhat from "hardhat";

async function main() {
    console.log("deploy start")
    
    // const wCeikPrice = await hardhat.ethers.getContractFactory("wCeikPrice")
    const wCeik = await hardhat.ethers.getContractFactory("wCeik")
    const result = await wCeik.deploy()
    // console.log(`wCeik address: ${result.address}`)
    console.log(` address: ${result.address}`)
    //0x5FbDB2315678afecb367f032d93F642f64180aa3
    // address: 0x5FbDB2315678afecb367f032d93F642f64180aa3
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });