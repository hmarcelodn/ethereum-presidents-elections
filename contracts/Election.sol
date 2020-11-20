pragma solidity >=0.4.25 <0.7.0;

// https://www.youtube.com/watch?v=3681ZYbDSSk&t=1268s
// ln -s ../../build/contracts contracts
// Election Contract
contract Election {
    // Model the candidate
    struct Candidate {
        uint id;
        uint voteCount;
        string name;
        string photo;
    }

    // Fetch Candidates (I cannot get the mapping count)
    mapping(uint => Candidate) public candidates;

    // Store account that have voted
    mapping(address => bool) public voters;

    // Store Candidates Count
    uint public candidatesCount;

    // Voted event
    event votedEvent (uint indexed _candidateId);

    // Constructor
    constructor () public {
        addCandidate("Donald Trump", "https://www.aljazeera.com/wp-content/uploads/2020/11/Trump-2.jpg?resize=570%2C380");
        addCandidate("Joe Biden", "https://cdn.cnn.com/cnnnext/dam/assets/201112041647-06-joe-biden-1110-restricted-large-169.jpg");
        addCandidate("Cory Brooker", "https://static01.nyt.com/images/2019/12/13/us/politics/00bookerout-hfo/00bookerout-hfo-superJumbo.jpg");
    }

    // Store a candidate
    function addCandidate(string memory _name, string memory _photo) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, 0, _name, _photo);
    }

    // Vote a candidate
    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record voter (msg.sender) solidity account number who is calling
        voters[msg.sender] = true;

        // update candidate vote count
        candidates[_candidateId].voteCount ++;

        // Trigger Event
        emit votedEvent(_candidateId);
    }
}