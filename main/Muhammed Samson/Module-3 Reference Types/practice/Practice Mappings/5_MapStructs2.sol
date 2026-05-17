// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice mappings exercise behavior in a focused contract example.

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    // Shows how this exercise handles create user.
    function createUser() external {
        require(!users[msg.sender].isActive);
        users[msg.sender] = User(100, true);
    }

    // Shows how this exercise handles transfer.
    function transfer(address recipient, uint amount) external {
        require(users[msg.sender].isActive);
        require(users[recipient].isActive);
        require(users[msg.sender].balance >= amount);
        users[msg.sender].balance -= amount;
        users[recipient].balance += amount;
    }
}
