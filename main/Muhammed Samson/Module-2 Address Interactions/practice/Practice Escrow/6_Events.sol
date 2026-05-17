// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice escrow exercise behavior in a focused contract example.

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint);

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    // Shows how this exercise handles approve.
    function approve() external {
        require(msg.sender == arbiter);
        uint balance = address(this).balance;
        (bool s, ) = beneficiary.call{ value: balance }("");
        require(s);
        emit Approved(balance);
    }
}
