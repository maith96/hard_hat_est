require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/15d3f8d0ba474cec978b982ff456fb4f`,
      accounts: [
        "72a2daa2e590dd0ec1f9df3f59ca8684d531de6aceb5778fa101ff125a147ba9",
      ],
    },
  },
};
