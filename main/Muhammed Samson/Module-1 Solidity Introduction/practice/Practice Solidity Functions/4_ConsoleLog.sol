// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "forge-std/console.sol";


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice solidity functions exercise behavior in a focused contract example.

contract Contract {
    // Shows how this exercise handles winning number.
    function winningNumber(string calldata message) external view returns (uint) {
        console.log(message);
        return 794;
    }
}
