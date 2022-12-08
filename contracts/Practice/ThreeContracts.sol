//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract A{
    
    function getNumber(address _contractId) public view returns(uint) {
        return B(_contractId).getNumber();
    }

    function callThingy(address _contractId) public pure returns(string memory) {
        return C(_contractId).getThingy();
    }

    function setBNumber(uint _number, address _contractIdC, address _contractIdB) public {
        C(_contractIdC).setBNumber(_number, _contractIdB);
    }

    function setBNumberDirect(uint _number, address _contractIdB) public {
        B(_contractIdB).setNumber(_number);
    }

}

contract B {
    address walletId;
    address contractC;
    uint private number = 12;

    constructor(address _walletId, address _contractC) {
        walletId = _walletId;
        contractC = _contractC;
    }

    function getNumber() public view returns(uint) {
        return(number);
    }

    function setNumber(uint _number) public {
        require(msg.sender == contractC, "Not the correct contract!");
        number = _number;
    }
}

contract C {
    function getThingy() public pure returns(string memory) {
        return "Thingy";
    }

    function setBNumber(uint _number, address _contractId) public {
        B(_contractId).setNumber(_number);
    }
}