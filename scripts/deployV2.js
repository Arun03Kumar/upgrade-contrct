const { ethers, upgrades } = require("hardhat");

async function main() {
  const DarkTokenV2 = await ethers.getContractFactory("DarkTokenV2");
  console.log("Upgrading DarkToken...");
  await upgrades.upgradeProxy(
    "0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9",
    DarkTokenV2
  );
  console.log("DarkToken upgraded");
}

main();
