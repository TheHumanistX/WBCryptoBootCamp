//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract vault {
    address payable creator;

    constructor() payable{
        creator = payable(msg.sender); 
    }

    modifier onlyOwner() {
        require(creator == msg.sender, "I don't know you! That's my purse!");
        _;
    }
    receive() external payable{}

    function depositSomeMoney() public payable returns(uint) {
        return msg.value;
    }

    function getBalance() external view returns(uint, string memory) {
        return (address(this).balance / 1e18, " eth");
    }

    function takeOutWithTransfer(uint amount) public onlyOwner {
        address payable mine = payable(msg.sender);
        mine.transfer(amount * 1e18);
        // 
    }

    function takeOutWithSend(uint amount) public onlyOwner returns(bool) {
        address payable mine = payable(msg.sender);
        bool tryToSend = mine.send(amount * 1e18);
        return tryToSend;
    }

    function takeOutWithCall(uint amount) public onlyOwner returns (bool, bytes memory) {
        address payable mine = payable(msg.sender);
        (bool tryToSend, bytes memory data) = mine.call{value: amount * 1e18, gas: 5000}("");
        return(tryToSend, data);
    }
}