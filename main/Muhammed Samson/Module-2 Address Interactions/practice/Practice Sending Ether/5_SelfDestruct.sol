// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice sending ether exercise behavior in a focused contract example.

contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    receive() external payable {
    }

    // Shows how this exercise handles tip.
    function tip() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success);
    }

    // Shows how this exercise handles donate.
    function donate() public {
        selfdestruct(payable(charity));
    }
}