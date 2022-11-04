const { ethers, upgrades } = require("hardhat");
const hre = require("hardhat");

async function main() {
   const DarkToken = await ethers.getContractFactory("DarkToken");
   console.log("Deploying DarkToken...");
   const darktoken = await upgrades.deployProxy(DarkToken, [1000000], {
     initializer: "initialize",
   });
   await darktoken.deployed();
   console.log("DarkToken deployed to:", darktoken.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
