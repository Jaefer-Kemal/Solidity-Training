// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates build a voting contract exercise behavior in a focused contract example.

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    // Shows how this exercise handles new proposal.
    function newProposal(address target, bytes calldata data) external {
        proposals.push(Proposal(target, data, 0, 0));
    }

    // Shows how this exercise handles cast vote.
    function castVote(uint proposalId, bool support) external {
        if (support) {
            proposals[proposalId].yesCount++;
        } else {
            proposals[proposalId].noCount++;
        }
    }
}
