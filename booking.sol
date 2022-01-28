// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract booking{
    uint8 public totalSeats;
    address payable public owner;
    mapping(address => uint8) bal;

    modifier checkAmt(){
        require(msg.value == 1 ether);
        _;
    }

    constructor(uint8 _seats, address _acc) {
        owner = payable(_acc);
        totalSeats = _seats;
    }
    function buyTicket( uint8 noSeats) public payable checkAmt returns (uint8){
        totalSeats -= noSeats;
        owner.transfer(msg.value); 
        bal[owner] += 1;
        return totalSeats;
    }
    function getBal() external view returns(uint){
        return bal[owner];
    }
}