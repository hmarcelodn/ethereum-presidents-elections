function Home(props, context) {
    const web3Context = context.web3;
    /**
     * web3Context = {
     *   accounts: {Array<string>} - All accounts
     *   selectedAccount: {string} - Default ETH account address (coinbase)
     *   network: {string} - One of 'MAINNET', 'ROPSTEN', or 'UNKNOWN'
     *   networkId: {string} - The network ID (e.g. '1' for main net)
     * }
     */

     console.log(web3Context);

    return (
        <div>
            Hello Web3
        </div>
    );
}

export default Home;
