// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice arrays exercise behavior in a focused contract example.

contract Contract {
    uint[] public evenNumbers;

    // Shows how this exercise handles filter even.
    function filterEven(uint[] calldata numbers) external {
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenNumbers.push(numbers[i]);
            }
        }
    }
}
