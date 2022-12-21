//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NewToken is ERC20("GarboCoin", "GBC") {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);

    }

    modifier isOwner() {
        require(msg.sender == owner, "Ah ah ah! You didn't say the magic word!");
        _;
    }

    function burn()
}