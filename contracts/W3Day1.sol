//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract token is ERC20 ("MyTokenTest", "MTT") {

    mapping (address => uint) public tokensBurned;
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the creator/owner of this contract!");
        _;
    }

    function mintNewTokens(uint amount) public onlyOwner() {
        _mint(msg.sender, amount);
    }

    function burnAndAdd(uint amount) public {
        _burn(msg.sender, amount);
        tokensBurned[msg.sender] += amount;
    }

    function burned(address _address) public returns (uint) {
        return tokensBurned[_address];
    }

    function win() public {
        if(tokensBurned[msg.sender] >= 5) {
            selfdestruct(payable(msg.sender));
        } else {
            revert("You didn't have enough burned tokens to win.");
        }
    }
}