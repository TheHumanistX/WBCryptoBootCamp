//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract A{
    
    function getNumber() public view returns(uint) {
        return B(0x32316fE3DDf621fdAa71437Df19b94F9830c1118).getNumber();
    }

    function callThingy(address _contractId) public pure returns(string memory) {
        return C(_contractId).getThingy();
    }

}

contract B {
    address walletId;
    uint private number = 12;

    constructor(address _walletId) {
        walletId = _walletId;
    }

    function getNumber() public view returns(uint) {
        return(number);
    }
}

contract C {
    function getThingy() public pure returns(string memory) {
        return "Thingy";
    }
}