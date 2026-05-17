// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice arrays exercise behavior in a focused contract example.

contract Contract {
    // Shows how this exercise handles sum.
    function sum(uint[] calldata numbers) external pure returns (uint) {
        uint total = 0;
        for (uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
        return total;
    }
}
