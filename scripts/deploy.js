const main = async() => {
    const [ deployer ] = await ethers.getSigners();
    console.log("Deploying contract with the account:", deployer.address);
    const PasswordManager = await ethers.getContractFactory("PasswordManager");
    const deployed = await PasswordManager.deploy();
    console.log("Password Manager is deployed at: ", deployed.address);
};



main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    })