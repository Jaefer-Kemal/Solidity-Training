// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice reverting transactions exercise behavior in a focused contract example.

contract Contract {
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    // Shows how this exercise handles withdraw.
    function withdraw() public {
        require(msg.sender == owner);
        (bool s, ) = owner.call{ value: address(this).balance }("");
        require(s);
    }
}
