// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }
    
    Proposal[] public proposals;
    
    mapping(address => bool) public isMember;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
    event ProposalExecuted(uint proposalId);

    modifier onlyMember() {
        require(isMember[msg.sender], "Not a voting member");
        _;
    }

    constructor(address[] memory _members) {
        isMember[msg.sender] = true;
        for (uint i = 0; i < _members.length; i++) {
            isMember[_members[i]] = true;
        }
    }

    function newProposal(address target, bytes calldata data) external onlyMember {
        proposals.push();
        Proposal storage proposal = proposals[proposals.length - 1];
        proposal.target = target;
        proposal.data = data;
        proposal.yesCount = 0;
        proposal.noCount = 0;
        proposal.executed = false;
        
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool _supports) external onlyMember {
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
        
        emit VoteCast(proposalId, msg.sender);
        
        // Execute if we have 10 or more yes votes and not already executed
        if (proposal.yesCount >= 10 && !proposal.executed) {
            proposal.executed = true;
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");
            emit ProposalExecuted(proposalId);
        }
    }
}