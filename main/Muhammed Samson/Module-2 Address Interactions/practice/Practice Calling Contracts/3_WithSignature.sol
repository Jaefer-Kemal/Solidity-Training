// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice calling contracts exercise behavior in a focused contract example.

contract Sidekick {
    // Shows how this exercise handles send alert.
    function sendAlert(address hero, uint256 enemies, bool armed) external {
        (bool success, ) = hero.call(
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed)
        );
        require(success);
    }
}
