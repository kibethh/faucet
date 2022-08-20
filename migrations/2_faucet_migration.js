const FaucetMigration = artifacts.require("Faucet");

module.exports = function (deployer) {
  deployer.deploy(FaucetMigration);
};
