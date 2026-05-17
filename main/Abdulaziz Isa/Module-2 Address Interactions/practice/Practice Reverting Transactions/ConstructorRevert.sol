// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address owner;

    constructor() payable {
        require(msg.value >= 1 ether, "Must deposit at least 1 ether");
        owner = msg.sender;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        (bool s, ) = owner.call{ value: address(this).balance }("");
        require(s);
    }
}