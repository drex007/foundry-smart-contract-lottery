// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity  0.8.24;


/**
 * @title  A raffle contract
 * @author Viktor Ojemeni
 * @notice Just for creating a simple raffle 
 * @dev Implement chainVRF
 */

contract Raffle {

    /** Errors */
    error sendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee; //immutable variable


    constructor(uint256 entranceFee){
        i_entranceFee = entranceFee;

    }

    function enterRaffle() public payable{
        if(msg.value < i_entranceFee){
            revert sendMoreToEnterRaffle() ;
        }

    }

    function pickWinner() public {

    }
    /** Getter functions */

    function getEntranceFee() external view returns(uint256) {
        return i_entranceFee;
        
     }
}