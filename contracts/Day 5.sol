//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract Day5 {

    string[] public alphabet = ["A", "B", "C"];

    function addToEnd(string calldata _add) public {
        alphabet.push(_add);
    }

    function removeTheEnd() public {
        alphabet.pop();
    }

    function getLength() public view returns(uint) {
       return(alphabet.length);
    }

    bool[] public isOverTen;
    
    function overTen(int _number) public {

        if(_number >= 10) {
            isOverTen.push(true);
        } else {
            isOverTen.push(false);
        }
    }

    function overTenShort(int _number) public {
        _number >= 10 ? isOverTen.push(true): isOverTen.push(false);
    }

    function funLoops(uint cycles) public pure returns(uint) {

        uint count = 0;

        for(uint i = 0; i < cycles; i++) {
            
            if (i == 5) {
                continue;
            }

            if (i == 7) {
                break;
            }

            count = i;

        }
        return count;

    }

    function addTogether(uint loops) public pure returns(uint) {

        uint total = 0;

        for(uint i = 0; i < loops; i++) {
            total += i;
        }

        return total;

    }
}