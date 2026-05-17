// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice data types exercise behavior in a focused contract example.

contract Contract {
    enum Foods { Apple, Pizza, Bagel, Banana }

    Foods public food1 = Foods.Apple;
    Foods public food2 = Foods.Pizza;
    Foods public food3 = Foods.Bagel;
    Foods public food4 = Foods.Banana;
}