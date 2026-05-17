// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice mappings exercise behavior in a focused contract example.

contract Contract {
    mapping(address => bool) public members;

    // Shows how this exercise handles add member.
    function addMember(address member) external {
        members[member] = true;
    }

    // Shows how this exercise handles is member.
    function isMember(address member) external view returns (bool) {
        return members[member];
    }
}
