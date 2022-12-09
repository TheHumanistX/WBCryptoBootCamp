//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract tokenEasy is ERC20("WhiteboardCrypto", "WBC") {

    address public creator;

    constructor() {
        creator = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == creator, "Not the owner!");
        _;
    }

    function mintToken(uint _amount) public onlyOwner{
        _mint(msg.sender, _amount);
    }

}