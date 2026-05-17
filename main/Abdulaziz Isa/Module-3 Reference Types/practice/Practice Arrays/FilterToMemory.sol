// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function filterEven(uint[] calldata numbers) external pure returns(uint[] memory) {
        uint count;
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) count++;
        }

        uint[] memory evens = new uint[](count);
        uint index;
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                evens[index++] = numbers[i];
            }
        }
        return evens;
    }
}