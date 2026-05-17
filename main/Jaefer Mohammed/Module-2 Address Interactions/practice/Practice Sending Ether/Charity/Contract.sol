// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    receive() external payable {
    }

    function tip() public payable {
        (bool sent, ) = owner.call{ value: msg.value }("");
        require(sent, "Failed to send ether to owner");
    }

    function donate() public {
        uint balance = address(this).balance;
        (bool sent, ) = charity.call{ value: balance }("");
        require(sent, "Failed to send ether to charity");
    }
}