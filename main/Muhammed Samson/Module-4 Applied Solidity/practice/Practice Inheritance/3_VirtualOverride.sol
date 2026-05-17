// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Hero.sol";


// Muhammed Samson learning implementation based on course practice references.

// Demonstrates practice inheritance exercise behavior in a focused contract example.

contract Mage is Hero(50) {
    // Shows how this exercise handles attack.
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Spell);
    }
}

contract Warrior is Hero(200) {
    // Shows how this exercise handles attack.
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Brawl);
    }
}
