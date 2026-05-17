// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice sending ether exercise behavior in a focused contract example.

contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
}