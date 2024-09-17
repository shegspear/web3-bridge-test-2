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

        if(dice == 6 && (randomHash % 6) + 1 == 6) {
            emit YouWin();
        }
        
        dice = (randomHash % 6) + 1;
    }



}