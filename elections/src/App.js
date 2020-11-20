import './App.css';
import { useEffect, useState } from 'react';
import Web3 from 'web3';

import Election from 'contracts/Election.json';

import 'bootstrap/dist/css/bootstrap.min.css';

function App() {

  const [account, setAccount] = useState([]) ;
  const [candidates, setCandidates] = useState([]);
  const [network, setNetwork] = useState([]);

  // Fetch Ethereum Blockchain Data
  useEffect(() => {
    async function fetchBlockchainData() {
      const web3 = new Web3(Web3.givenProvider || 'http://localhost:7545');
      const network = await web3.eth.net.getNetworkType();
      const accounts = await web3.eth.getAccounts();
      const election = new web3.eth.Contract(Election.abi, Election.networks[5777].address);
      const candidatesCount = await election.methods.candidatesCount().call();

      // Save Wallet Accounts
      setAccount(accounts);
      setNetwork(network);

      // Get every Candidate from blockchain
      for (let i = 1; i <= candidatesCount; i++) {
        const candidate = await election.methods.candidates(i).call();
        setCandidates(state => state.concat(candidate));
      }
    }

    fetchBlockchainData();
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <h1>Ethereum Voting App</h1>

        <ul class="row">
          {candidates.map((candidate, index) => {
            return (
              <li class="col-sm">
                <div class="card">
                  <img class="card-img-top" src={candidate.photo} alt="Card image cap" />
                  <div class="card-body">
                    <p class="card-text">{candidate.name}</p>
                    <button type="button" class="btn btn-primary btn-lg">VOTE</button>
                  </div>
                </div>
              </li>
            );
          })}
        </ul>

        <div>
          <p>Your ethereum account: {account[0]}</p>
          <p>Your ethereum network: {network}</p>
        </div>
      </header>
    </div>
  );
}

export default App;
