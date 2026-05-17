// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice reverting transactions exercise behavior in a focused contract example.

contract Contract {
    address immutable owner;
    uint public configA;
    uint public configB;
    uint public configC;

    constructor() {
        owner = msg.sender;
    }

    // Shows how this exercise handles set a.
    function setA(uint _configA) public onlyOwner {
        configA = _configA;
    }

    // Shows how this exercise handles set b.
    function setB(uint _configB) public onlyOwner {
        configB = _configB;
    }

    // Shows how this exercise handles set c.
    function setC(uint _configC) public onlyOwner {
        configC = _configC;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}
