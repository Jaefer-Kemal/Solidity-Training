// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function filterEven(uint[] calldata numbers) external pure returns(uint[] memory) {
        // First pass: count how many even numbers there are
        uint evenCount = 0;
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                evenCount++;
            }
        }
        
        // Create array with the exact size needed
        uint[] memory evens = new uint[](evenCount);
        
        // Second pass: fill the array with even numbers
        uint currentIndex = 0;
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                evens[currentIndex] = numbers[i];
                currentIndex++;
            }
        }
        
        return evens;
    }
}