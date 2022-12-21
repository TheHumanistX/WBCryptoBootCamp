//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract multiSig {

    address[] public owners;
    uint public approvalsNeeded = 2;
    mapping(address => bool) public ownerList;
    mapping(uint => mapping(address => bool)) public alreadyVoted;

    constructor() {
        owners.push(msg.sender);
        ownerList[msg.sender] = true;

        owners.push(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        ownerList[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = true;

        owners.push(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        ownerList[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = true;
    }

    modifier onlyOwner() {
        require(ownerList[msg.sender] == true, "Not the owner!");
        _;
    }

    receive() external payable{}

    struct Transaction {
        address sendingTo;
        uint value;
        bool alreadyExecuted;
        uint approvals;
    }

    Transaction[] public proposedTransactions;

    function proposeTX(address _addressTo, uint _amount) public {
        proposedTransactions.push(Transaction({
            sendingTo: _addressTo,
            value: _amount,
            alreadyExecuted: false,
            approvals: 0

        }));
    }

    function voteOnTransaction(uint _index) public onlyOwner {
        require(alreadyVoted[_index][msg.sender] == false, "You already voted.");
        proposedTransactions[_index].approvals += 1;
        alreadyVoted[_index][msg.sender] = true;
    }

    function executeTX(uint _index) public onlyOwner {
        require(proposedTransactions[_index].approvals >= 2, "Not enough approvals for this transaction!");
        require(proposedTransactions[_index].alreadyExecuted == false, "Already executed!");
        address payable toSend = payable(proposedTransactions[_index].sendingTo);
        (bool tryToSend,) = toSend.call{value: proposedTransactions[_index].value}("");
        require(tryToSend, "You don't have enough ether!");
        proposedTransactions[_index].alreadyExecuted = true;
    }
}