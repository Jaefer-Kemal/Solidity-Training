// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice arrays exercise behavior in a focused contract example.

contract StackClub {
    address[] public members;

    constructor() {
        members.push(msg.sender);
    }

    // Shows how this exercise handles add member.
    function addMember(address member) external onlyMember {
        members.push(member);
    }

    // Shows how this exercise handles remove last member.
    function removeLastMember() external onlyMember {
        members.pop();
    }

    // Shows how this exercise handles is member.
    function isMember(address addr) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == addr) {
                return true;
            }
        }
        return false;
    }

    modifier onlyMember {
        require(isMember(msg.sender));
        _;
    }
}
