// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice calling contracts exercise behavior in a focused contract example.

interface IHero {
    // Shows how this exercise handles alert.
    function alert() external;
}

contract Sidekick {
    // Shows how this exercise handles send alert.
    function sendAlert(address hero) external {
        IHero(hero).alert();
    }
}
