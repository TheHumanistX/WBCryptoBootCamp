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
        if(_input.equals("cookie")) {
            return "yum";
        } else {
            return "yuck";
        }
    }


}

