// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

// TODO: create Mage/Warrior Heroes
contract Warrior is Hero(200) {
    // Inherits health state variable and takeDamage function from Hero
    // Initial health is set to 200 via constructor argument
    
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Brawl);
        super.attack(enemy);
    }
}

contract Mage is Hero(50) {
    // Inherits health state variable and takeDamage function from Hero
    // Initial health is set to 50 via constructor argument
    
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Spell);
        super.attack(enemy);
    }
}