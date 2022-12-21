//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract timedToken is ERC20("TimedTest", "TT") {
    
    uint public totalPerDayToSpend = 5;
    mapping(address => uint) public lastTimeSpent;
    mapping(address => uint) public alreadySpentToday;
    mapping(address => bool) public exclusionList;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Ah ah ah... you didn't say the magic word!");
        _;
    }

    function timedTransfer(address _sendingTo, uint _amount) public {
        if (exclusionList[msg.sender] == true) {
            _transfer(msg.sender, _sendingTo, _amount);
        } else{
            require(_amount < totalPerDayToSpend, "Trying to send more than 5 tokens in 24 hrs is not allowed!");
            if (lastTimeSpent[_sendingTo] + 24 hours < block.timestamp) {
            // transfer our tokens, if 5 or under

                lastTimeSpent[msg.sender] = block.timestamp;
                alreadySpentToday[msg.sender] = _amount;
                _transfer(msg.sender, _sendingTo, _amount);
            } else {
            // check how many they've spent today
                if (alreadySpentToday[msg.sender] + _amount >= totalPerDayToSpend) {
                // cannot spend, over daily allowance
                    revert("You've spent your 5 token allowance for the day!");
                } else {
                    // can spend
                    lastTimeSpent[msg.sender] = block.timestamp;
                    alreadySpentToday[msg.sender] += _amount;
                    _transfer(msg.sender, _sendingTo, _amount);

                }
            }
        }

        
        
    }

    function mintFive() public {
            _mint(msg.sender, 5);
    }

    function addToExclusions(address _excludedAccount) public onlyOwner {
        exclusionList[_excludedAccount] = true;
    } 
}