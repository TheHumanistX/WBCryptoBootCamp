// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract Helloworld {
    string public greet = "Hello World!";
    //our hello world example!

    bool public lightSwitch = false;
    //this creates a boolean variable named "Lightswitch" and sets it to false

    uint public myAge = 25;
    //this creates an unsigned integer that is named "myAge" and sets it to 25

    int public bankAccount = -1000;
    //this creates a signed integer (can allow negative numbers) named "bankAccount" that is equal to -1000

    address public myColdWallet = 0x61236DE2834fDcE9A4b4Fa3B68dDe39Eca7199Cb;
    //this creates an address variable that is named "MyColdWallet", and I set it to my actual cold wallet

    enum daysOfTheWeek{Mon, Tue, Wed, Thr, Fri, Sat, Sun}
    //this creates a new enumeration named "daysOfTheWeek" which contain a 3 letter abbreviation of each day
    
    daysOfTheWeek public tomorrow = daysOfTheWeek.Mon;
    //this creates a variable that is a "daysOfTheWeek" type, which is public and named "tomorrow"
    //we are setting it equal to Mon, which is technically spot 0. 

    bytes1 exampleBytes = 0x20;
    //this is an example of 8 bits of data





    //THE FOLLOWING VARIABLES ARE 'REFERENCE' TYPES

//arrays
    string[] public friends = ["Gabriel", "Lucas", "Neiko"];
    //this creates an array that can change size (denoted by the []) of a bunch of strings
    //it is public, and the name is "friends"
    //we gave it 3 friends

    uint[4] public tirePressure = [30,29,29,4];
    //this creates an array of 4 uints
    //it is public and named (tire pressure)
    //you can see it has 30, 29, 29, and 4... 

//strings
    string public myUsername = "WhiteboardCrypto";
    //this creates a string named "myUsername" which is public

//maps
    mapping (string => int) public points;
    //this creates a "map", which is basically an x,y table
    //the left value is a string
    //the right value is an integer
    //the name is points
    //we could store something like "Theodore" = 10 points in the future with this

//structures
    struct car{
        uint wheels;
        uint windows;
        string model;
    }
    //this creates a new variable type named "car", which has 3 data points -> wheels, windows, and model.
    //wheels and windows MUST be a uint, and model MUST be a string
    
    car public myBrokenDownFord = car(3,4,"Ford");
    //this creates a new 'car' that is named "myBrokenDownFord" which has 3 wheels, 4 windows, and is a "Ford"

//notes

    //public variables are accessible by anyone
    //it does not cost gas to read a public variable
    
    //private variables are only accessible within the same contract they are declared

    //internal variables are accessible in the same contract they are declared, and any contract that is built on top of it

}