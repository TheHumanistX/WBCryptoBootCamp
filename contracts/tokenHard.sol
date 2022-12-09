//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract tokenHard {

    address private creator;

    constructor() {
        creator = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == creator, "You are not the contract owner! Don't be naughty!");
        _;
    }

    mapping (address => uint) public balances;

    string public name = "WhiteboardCrypto Token";
    string public symbol = "WBC";

    uint public totalSupply = 0;

    function getBalance(address _whichToCheck) public view returns(uint) {
        return balances[_whichToCheck];
    }

    function addFive() public onlyOwner {
        totalSupply += 5;
        balances[msg.sender] += 5;

    }

    function transferToOther(address payable _otherWallet, uint _amount) public payable returns(bool) {
        require(_amount <= balances[msg.sender], "You don't have enough Eth!");
        require(_otherWallet != address(0));
        balances[msg.sender] -= _amount;
        balances[_otherWallet] += _amount;
        return true;
    }


}