// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract Ludo {
    address public owner;

    uint8 public steps;
    uint256 public dice;

    event YouWin();
    event SorryYouLoose();

    constructor() {
       owner = msg.sender; 
    }

    function rollDice() public {
        uint256 randomHash = uint256(
            keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))
        );
        
        dice = (randomHash % 6) + 1;
    }



}