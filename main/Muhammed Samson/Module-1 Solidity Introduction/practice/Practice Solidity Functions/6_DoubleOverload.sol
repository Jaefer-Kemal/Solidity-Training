// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice solidity functions exercise behavior in a focused contract example.

contract Contract {
    // Shows how this exercise handles double.
    function double(uint _value) external pure returns (uint) {
        return _value * 2;
    }

    // Shows how this exercise handles double.
    function double(uint _a, uint _b) external pure returns (uint, uint) {
        return (_a * 2, _b * 2);
    }
}