// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice inheritance exercise behavior in a focused contract example.

contract Ownable {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract Transferable is Ownable {
    // Shows how this exercise handles transfer.
    function transfer(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
