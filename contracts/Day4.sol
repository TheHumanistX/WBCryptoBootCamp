//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract day4 {
    function addTwos() public returns(int) {
        return 2 + 2;
    }

    function add(int _a, int _b) public pure returns(int) {
        return _a + _b;
    }

    int public age = 26;

    function getAge() public view returns(int) {
        return age;
    }

    function changeAge(int _newAge) public {
        age = _newAge;
    }

    string public name = "Brian";

    function getName() public view returns(string memory) {
        return name;
    }

    function changeName(string memory _name) public {
        name = _name;
    }

    function changeNameToBasil() public {
        changeName("Basil");
    }
}

//function NAME(arguments) visablity mutability 

// Visibility
// public - anyone 
// private - internally
// internal - internally and other contracts that are built on it
// external - other contracts and EOAs

// Mutability
// view - not changing the blockchain, only reading it
// pure - not changing or reading (computing)
// payable - requires ETH to run
// non-payable - default, don't need to type

// Explicit Data Location (Only needed for reference type variables... strings, arrays, mappings, structs
// storage - stored on the blockchain
// memory - like RAM, temporary data location
// calldata - memory, but can't change it