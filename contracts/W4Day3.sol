//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract simpleNFT is ERC721, Ownable{

    uint public totalSupply;
    uint public maxSupply;
    string public baseURL;

    constructor(string memory _enteredURL, uint _max) ERC721("NFTtest", "NFT") {
        baseURL = _enteredURL;
        maxSupply =  _max;
    }

    function _baseURI() internal view override returns(string memory) {

        return baseURL;

    }

    function safeMint(address _mintingTo) public onlyOwner {

        require(maxSupply > totalSupply, "Cannot mint anymore");
        uint tokenId = totalSupply;
        totalSupply += 1;
        _mint(_mintingTo, tokenId);

    }

}