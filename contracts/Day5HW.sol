//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract Day5HW {

    function adds() public pure returns(uint) {
       return 60 + 40;
    }

    function name() public pure returns(string memory) {
        return "Brian";
    }

    function yum(string memory _input) public view returns (string memory) {
        if(keccak256(abi.encodePacked("cookie")) == keccak256(abi.encodePacked(_input))) {
            return "yum";
        } else {
            return "yuck";
        }
    }

    function addsTwo(uint _numOne, uint _numTwo) public view returns(string memory) {
        if(_numOne + _numTwo == 10) {
            return "party";
        }
    }

    function doubles(uint _times) public view returns(uint) {
        uint product = 1;
        for (uint i = 0; i < _times; i++) {
            product *= 2;
        }
        return(product);
    }

}

