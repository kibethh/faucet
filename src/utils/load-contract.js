import contract from "@truffle/contract";

export const loadContract = async (name, provider) => {
  const res = await fetch(`/contracts/${name}.json`);
  const artifact = await res.json();
  const _contract = contract(artifact);
  _contract.setProvider(provider);
  let deployedContract;
  try {
    deployedContract = await _contract.deployed();
  } catch (error) {
    console.error("You are connected to a wrong network", error);
  }

  return deployedContract;
};
