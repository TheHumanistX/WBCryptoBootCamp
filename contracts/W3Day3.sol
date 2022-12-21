//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract Airdrop is ERC20("Airdrop", "AIR") {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Ah ah ah! You didn't say the magic word!");
        _;
    }


    function mintSomeTokens(address[] memory _address, uint _amount) public onlyOwner {
        
        for(uint i = 0; i < _address.length; i++) {
            _mint(_address[i], _amount);
        }
        
        // _mint(_address, _amount);
    }

}

