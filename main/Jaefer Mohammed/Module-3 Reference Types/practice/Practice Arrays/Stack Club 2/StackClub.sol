// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] public members;

    constructor() {
        members.push(msg.sender);
    }

    modifier onlyMember() {
        require(isMember(msg.sender), "Only members can call this function");
        _;
    }

    function addMember(address newMember) external onlyMember {
        members.push(newMember);
    }

    function removeLastMember() external onlyMember {
        members.pop();
    }

    function isMember(address user) public view returns(bool) {
        for(uint i = 0; i < members.length; i++) {
            if(members[i] == user) {
                return true;
            }
        }
        return false;
    }
}