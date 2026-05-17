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
}