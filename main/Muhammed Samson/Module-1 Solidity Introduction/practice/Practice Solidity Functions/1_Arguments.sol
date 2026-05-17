// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice solidity functions exercise behavior in a focused contract example.

contract Contract {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }

    // Shows how this exercise handles increment.
    function increment() external {
        x += 1;
    }

    // Shows how this exercise handles add.
    function add(uint _value) external view returns (uint) {
        return x + _value;
    }
}