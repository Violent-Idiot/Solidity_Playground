// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract login{
    struct Details {
        address userAddr;
        string name;
        bytes32 pwd;
        bool isUserIn;
    }

    mapping(address => Details) user;

    modifier alreadySigned(){ //In Node js server development we call this middleware
        require(user[msg.sender].userAddr != msg.sender);
        _;
    }

    function signUp(string  memory _name, string memory _pwd) public alreadySigned returns (bool){
        user[msg.sender].userAddr = msg.sender;
        user[msg.sender].name = _name;
        user[msg.sender].pwd = keccak256(abi.encodePacked(_pwd));
        user[msg.sender].isUserIn = false;
        return true;
    }

    function signIn(string memory _pwd) public returns (bool){
        
        if(user[msg.sender].pwd == keccak256(abi.encodePacked(_pwd))){
            user[msg.sender].isUserIn = true;
            return true;
        } else {
            return false;
        }
    }

    function checkUserLoggedIn(address _addr) public view returns (bool){
        return user[_addr].isUserIn;
    }

    function logOut() public{
        user[msg.sender].isUserIn = false;
    }

}