// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice calling contracts exercise behavior in a focused contract example.

contract Sidekick {
    // Shows how this exercise handles relay.
    function relay(address hero, bytes memory data) external {
        (bool success, ) = hero.call(data);
        require(success);
    }
}
