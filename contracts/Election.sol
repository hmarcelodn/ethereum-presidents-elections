pragma solidity >=0.4.25 <0.7.0;

// https://www.youtube.com/watch?v=3681ZYbDSSk&t=1268s
// Election Contract
contract Election {
    // Model the candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store Candidates

    // Fetch Candidates (I cannot get the mapping count)
    mapping(uint => Candidate) public candidates;

    // Store Candidates Count
    uint public candidatesCount;

    // Constructor
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    // Store a candidate
    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}