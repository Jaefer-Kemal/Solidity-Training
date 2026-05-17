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

    Vote public vote;

    // Shows how this exercise handles create vote.
    function createVote(Choices choice) external {
        vote = Vote(choice, msg.sender);
    }
}
