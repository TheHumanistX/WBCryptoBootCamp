//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract Week2Day4 {

    address[] public addresses;
    mapping (address => uint) balance;
    mapping (address => bool) isOnList;
    address public creator;


    constructor() {
        creator = msg.sender;
    }
    /*
    constructor() payable {
        require(msg.value > 0, "Didn't send enough!");
        balance[msg.sender] = msg.value;
    }
    receive() external payable{
        balance[msg.sender] += msg.value;
    }
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    function getBalance(address _address) public view returns(uint) {
        return balance[_address];
    }
    function transferETH(address payable _address, uint _amount) public {
        require(balance[msg.sender] >= _amount, "Insufficient Balance!");
        balance[msg.sender] -= _amount;
        _address.transfer(_amount);
    }
    function sendETH(address payable _address, uint _amount) public {
        require(balance[msg.sender] >= _amount, "Insufficient Balance!");
        balance[msg.sender] -= _amount;
        require(_address.send(_amount), "Transaction Failed");
    }
    function callETH(address payable _address, uint _amount) public returns(bool, bytes memory) {
        require(balance[msg.sender] >= _amount, "Insufficient Balance!");
        balance[msg.sender] -= _amount;
        (bool success, bytes memory data) = _address.call{value: _amount}("");
        require(success == true, "Transfer failed.");
        return (success, data);
    }
    */

    function joinList() public {
        require(msg.sender != creator, "You can't join, you made this contract!");
        require(isOnList[msg.sender] == false, "Already on the list!");
        addresses.push(msg.sender);
        isOnList[msg.sender] = true;

    }

    function airdrop() public payable {
        /*
        uint arrayLength = addresses.length;
        if (isOnList[msg.sender] == true) {
            arrayLength -= 1;
        }
        */
        require(msg.value >= addresses.length, "Not enough for the airdrop!");
        uint amountToSendEach = msg.value / addresses.length;
        for (uint i = 0; i < addresses.length; i++) {
            addresses[i].call{value: amountToSendEach}("");
        }
    }

}