// SPDX-License-Identifier: MIT
pragma solidity 0.8.13 ;



//gas is refunded, state variables are reverted, and no changes happen to blockchain

contract W2Day1{


    function getInfo() public view returns(uint, uint, uint, address){
        return (block.chainid, block.difficulty, block.number, msg.sender);
    }



    uint public value = 100;

    function getValue() public view returns(uint){
        require(msg.sender == 0x0000000000000000000000000000000000000000, "You're not the owner!");//long error message = more gas
        //require is used to check inputs and also really good at controlling ownership of a contract
        return value;
    }


    function getValuetwo() public view returns(uint){

        if(msg.sender != 0x0000000000000000000000000000000000000000){
            revert("You're not the owner!");
        }

        return value;

    }

    function assertValue() public view returns(bool){

        assert (value == 100); //if the statement is untrue, it will revert, used for code that should never be false
        return true;

    }

//modifiers
    modifier onlyOwner(){
        require(msg.sender == 0x0000000000000000000000000000000000000000);
        _;
    }

    function getValueModifier() public view onlyOwner returns(uint){
        return value;
    }



//constructors
//you could even put something to give the constructor, and it uses that to pass on data upon creation
    address public contractCreator;
    constructor (){
        contractCreator = msg.sender;
    }

//modifier that uses constructor variable
    modifier onlyOwnerNew(){
        require(msg.sender == contractCreator);
        _;
    }

    function getValueModifierConstructor() public view onlyOwnerNew returns(uint){
        return value;
    }




}