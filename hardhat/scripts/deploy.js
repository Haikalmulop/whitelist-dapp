const { ethers } = require("hardhat");

async function main() {

  /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistContract here is a factory for instances of our Whitelist contract.
  */
    const whitelistContract = await ethers.getContractFactory("whitelist");

    //deploy contract
    //10 is the maximum number of whitelisted addresses
    const deployedWhitelistContract = await whitelistContract.deploy(10);

    //wait for finish deploying
    await deployedWhitelistContract.deployed();

    //print deployed contract
    console.log("whitelist contract addresses;", deployedWhitelistContract.address);

}

//call the main function
    main()
    .then (() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });

