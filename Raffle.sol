// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity  0.8.24;


/**
 * @title  A raffle contract
 * @author Viktor Ojemeni
 * @notice Just for creating a simple raffle 
 * @dev Implement chainVRF
 */


/** Errors */



contract Raffle {

    /**Error */
    error Raffle_sendMoreToEnterRaffle();

    /**Events */

    event RaffleEntered(address indexed player );

    uint256 private immutable i_entranceFee;
    uint256 private immutable i_interval; 
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;


    constructor(uint256 entranceFee, uint256 interval){
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;

    }

    function enterRaffle() public payable{
        if(msg.value < i_entranceFee){
            revert Raffle_sendMoreToEnterRaffle() ;
        }
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);

    }

    function pickWinner() public {

        if((block.timestamp - s_lastTimeStamp) < i_interval){
            revert();

        }
    }
    /** Getter functions */

    function getEntranceFee() external view returns(uint256) {
        return i_entranceFee;
        
     }
}