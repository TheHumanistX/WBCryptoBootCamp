//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract events {

    event log1(uint a, address b, string c);
    event log2(uint indexed a, address b, string c);
    event log3(uint a, address b, string indexed c);

    function callLog1() public {
        emit log1(5, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "Hey");
    }

    function callLog2() public {
        emit log2(5, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "Hey");    
    }

    function callLog3() public {
        emit log3(5, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "Hey");
    }
}