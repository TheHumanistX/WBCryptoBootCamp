//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract HWMultiSig {

    address public creator;
    address[] public owners;
    uint public approvalsRequired = 1;

    NewSignatory[] public proposedSignatories;
    Transaction[] public proposedTransactions;
    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public hasVotedNewSig;
    mapping(address => bool) public ownerList;

    constructor() {
        creator = msg.sender;
        owners.push(msg.sender);
        ownerList[msg.sender] = true;
    }

    modifier onlySigs() {
        require(ownerList[msg.sender] == true, "Not an owner.");
        _;
    }

    struct NewSignatory {
        address newSigAddress;
        uint approvals;
    }

    struct Transaction {
        address sendTo;
        uint amount;
        bool alreadyExecuted;
        uint approvals;
    }

    
    receive() external payable{}


    function proposeTX(address _sendTo, uint _amount) public {
        proposedTransactions.push(Transaction({
            sendTo: _sendTo,
            amount: _amount,
            alreadyExecuted: false,
            approvals: 0
        }));
    }

    function voteTX(uint _index) public onlySigs {
        require(hasVoted[_index][msg.sender] == false, "You have already voted.");
        proposedTransactions[_index].approvals += 1;
        hasVoted[_index][msg.sender] = true;

    }

    function executeTX(uint _index) public onlySigs {
        require(proposedTransactions[_index].approvals >= approvalsRequired, "Cannot execute Tx. Not enough approvals.");
        require(proposedTransactions[_index].alreadyExecuted == false, "This Tx has already been executed.");
        require(address(this).balance >= proposedTransactions[_index].amount, "Contract does not have large enough balance to send Tx.");

        (bool success,) = proposedTransactions[_index].sendTo.call{value: proposedTransactions[_index].amount}("");
        require(success == true, "Tx failed");
        proposedTransactions[_index].alreadyExecuted = true;
        
    }

    function proposeNewSignatory(address _newSignatory) public onlySigs {
        require(ownerList[_newSignatory] == false, "Already a signatory!");
        proposedSignatories.push(NewSignatory({
            newSigAddress: _newSignatory,
            approvals: 0
        }));
    }

    function voteNewSignatory(uint _index) public onlySigs {
        require(hasVotedNewSig[_index][msg.sender] == false, "Already voted!");
        proposedSignatories[_index].approvals += 1;
        hasVotedNewSig[_index][msg.sender] = true;
    }

    function addSignatory(uint _index) public onlySigs {
        require(ownerList[proposedSignatories[_index].newSigAddress] == false, "This address has already been added as a signatory.");
        require(proposedSignatories[_index].approvals >= approvalsRequired, "Not enough approvals!");
        owners.push(proposedSignatories[_index].newSigAddress);
        ownerList[proposedSignatories[_index].newSigAddress] = true;
        approvalsRequired = (approvalsRequired / 2) + 1;

    }

    function checkApprovals() private view onlySigs returns(bool) {
        
        if (owners.length - approvalsRequired >= owners.length - (owners.length - approvalsRequired) ) {
            return true;
        }
        return false;
    }

    function changeApprovalsByOne() private onlySigs {
        approvalsRequired += 1;
    }

    function retractVote(uint _index) public onlySigs {
        require(hasVoted[_index][msg.sender] == true, "You haven't voted yet!");
        proposedTransactions[_index].approvals -= 1;
        hasVoted[_index][msg.sender] = false;
    }

    

    // list of owners *
    // number of approvals required *
    // ability to receive funds *
    // ability to propose transaction *
    // ability to vote on proposal *
    // ability to retract a vote 
    // ability to execute transaction *
    // ability to add owners *
    // ability to change number of require approvals *


}