// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }
    
    Proposal[] public proposals;

    function newProposal(address target, bytes calldata data) external {
        proposals.push();
        Proposal storage proposal = proposals[proposals.length - 1];
        proposal.target = target;
        proposal.data = data;
        proposal.yesCount = 0;
        proposal.noCount = 0;
    }

    function castVote(uint proposalId, bool _supports) external {
        Proposal storage proposal = proposals[proposalId];
        
        // If already voted, revert the previous vote
        if (proposal.hasVoted[msg.sender]) {
            bool previousVote = proposal.votedYes[msg.sender];
            if (previousVote) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
        }
        
        // Cast the new vote
        if (_supports) {
            proposal.yesCount++;
            proposal.votedYes[msg.sender] = true;
        } else {
            proposal.noCount++;
            proposal.votedYes[msg.sender] = false;
        }
        
        proposal.hasVoted[msg.sender] = true;
    }
}