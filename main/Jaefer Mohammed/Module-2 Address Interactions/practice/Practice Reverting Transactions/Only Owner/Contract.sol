// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;

    constructor() payable {
        require(msg.value == 1 ether, "Must send exactly 1 ether");
        owner = msg.sender;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        uint balance = address(this).balance;
        (bool sent, ) = owner.call{ value: balance }("");
        require(sent, "Failed to send ether to owner");
    }
}