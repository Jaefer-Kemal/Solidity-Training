// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice calling contracts exercise behavior in a focused contract example.

contract Sidekick {
    // Shows how this exercise handles send alert.
    function sendAlert(address hero) external {
        bytes4 signature = bytes4(keccak256("alert()"));
        (bool success, ) = hero.call(abi.encodePacked(signature));
        require(success);
    }
}
