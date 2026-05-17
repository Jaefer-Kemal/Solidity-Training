// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice structs exercise behavior in a focused contract example.

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    // Shows how this exercise handles create vote.
    function createVote(Choices choice) external {
        require(!this.hasVoted(msg.sender));
        votes.push(Vote(choice, msg.sender));
    }

    // Shows how this exercise handles has voted.
    function hasVoted(address addr) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == addr) {
                return true;
            }
        }
        return false;
    }

    // Shows how this exercise handles find choice.
    function findChoice(address addr) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == addr) {
                return votes[i].choice;
            }
        }
        revert("Vote not found");
    }
}
