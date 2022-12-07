//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

interface IA{

    function getValue() external view returns (string memory);

}

contract B {

    address public whichAddressToUse;
    constructor(address contractAddress) {

        whichAddressToUse = contractAddress;

    }

    function getValue() public view returns(string memory) {
        IA contractA = IA(whichAddressToUse);

        return contractA.getValue();
    }

}