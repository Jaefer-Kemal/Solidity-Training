// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        User storage user = users[msg.sender];
        require(!user.isActive, "User already exists");
        
        user.balance = 100;
        user.isActive = true;
    }

    function transfer(address recipient, uint amount) external {
        User storage sender = users[msg.sender];
        User storage receiver = users[recipient];
        
        require(sender.isActive, "Sender is not an active user");
        require(receiver.isActive, "Recipient is not an active user");
        require(sender.balance >= amount, "Insufficient balance");
        
        sender.balance -= amount;
        receiver.balance += amount;
    }
}