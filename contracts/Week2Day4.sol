//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract Week2Day4 {

    address[] public addresses;
    mapping(address => uint) public balance;
    mapping(address => bool) public isOnList;

    /*
    constructor() payable {
        require(msg.value > 0 ether, "You didn't send enough Ether!");
        balance[msg.sender] = msg.value;
    }
    
    receive() external payable {
        balance[msg.sender] += msg.value;

    }
    */

    function joinList() public {
        require(isOnList[msg.sender] == false, "You are already on the list for the airdrop! >:(");
        addresses.push(msg.sender);
        isOnList[msg.sender] = true;

    }

    function airdrop() public payable {
        uint arrayLength = addresses.length;
        if (isOnList[msg.sender] == true) {
                arrayLength -= 1;
            }
        
        require(msg.value >= arrayLength, "Not enough ETH for the airdrop!");
        uint airdropAmount = msg.value / arrayLength;
        for(uint i = 0; i < arrayLength; i++) {
            if (addresses[i] == msg.sender) {
                continue;
            }
            addresses[i].call{value: airdropAmount}("");
        }

    }

    /*
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    */

    function getUserBalance(address _address) public view returns(uint) {
        return balance[_address];
    }

    /*
    function transferETH(address payable _address, uint _amount) public {
        require(balance[msg.sender] > _amount, "Your balance is too low!");
        balance[msg.sender] -= _amount;
        _address.transfer(_amount);
    }

    function sendEth(address payable _address, uint _amount) public {
        require(balance[msg.sender] > _amount, "Your balance is too low!");
        balance[msg.sender] -= _amount;
        require(_address.send(_amount), "Transaction failed!");
    }

    function callETH(address payable _address, uint _amount) public returns(bool, bytes memory) {
        require(balance[msg.sender] > _amount, "Balance too low!");
        balance[msg.sender] -= _amount;
        (bool success, bytes memory data) = _address.call{value: _amount}(""); 
        require(success = true, "Transacion failed!");
        return (success, data);
    }

    */

    
}