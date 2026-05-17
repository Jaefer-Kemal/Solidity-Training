// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
    }

    enum VoteStatus { NotVoted, Yes, No }

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    Proposal[] public proposals;
    mapping(uint => mapping(address => VoteStatus)) voteStatuses;
    mapping(address => bool) members;

    constructor(address[] memory _members) {
        members[msg.sender] = true;
        for(uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    function newProposal(address target, bytes calldata data) external {
        require(members[msg.sender], "Not a member");
        proposals.push(Proposal(target, data, 0, 0, false));
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support) external {
        require(members[msg.sender], "Not a member");
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.executed, "Proposal already executed");

        VoteStatus status = voteStatuses[proposalId][msg.sender];

        if(status == VoteStatus.Yes) {
            proposal.yesCount--;
        } else if(status == VoteStatus.No) {
            proposal.noCount--;
        }

        if(support) {
            proposal.yesCount++;
            voteStatuses[proposalId][msg.sender] = VoteStatus.Yes;
        } else {
            proposal.noCount++;
            voteStatuses[proposalId][msg.sender] = VoteStatus.No;
        }

        emit VoteCast(proposalId, msg.sender);

        if(proposal.yesCount >= 10) {
            proposal.executed = true;
            (bool s, ) = proposal.target.call(proposal.data);
            require(s);
        }
    }
}