//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

interface ITheo {
    function signMe(address _address, string memory _message) external returns(string memory);
}

contract myContract {

    

    function signMeSetup() public {
        ITheo useInterface = ITheo(0x3CdBff65DaC67cDb6E5c4F05c4DB8FE05C20e4D8);
        useInterface.signMe(msg.sender, "Hey! I did it! Hah");
    }
}

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NewToken is ERC20("ThatFellaSeesYou", "TFSY"){
    function sendTokens() public {
        _mint(0x3CdBff65DaC67cDb6E5c4F05c4DB8FE05C20e4D8, 5);
    } 
}