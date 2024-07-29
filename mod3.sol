// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract mod3 is ERC20, Ownable {
    constructor(uint256 initialAmount, uint8 decimalPlaces, string memory tokenName, string memory tokenSymbol) 
        ERC20(tokenName, tokenSymbol) 
        Ownable(msg.sender) 
    {
        _mint(msg.sender, initialAmount * (10 ** uint256(decimalPlaces)));
    }
    
    // Only the contract owner is allowed to create new tokens
    function mint(address recipient, uint256 quantity) public onlyOwner {
        _mint(recipient, quantity);
    }
    
    // Any token holder can destroy their own tokens
    function burn(uint256 quantity) public {
        _burn(msg.sender, quantity);
    }

    // Overrides the transfer function to enable token transfers
    function transfer(address receiver, uint256 quantity) public override returns (bool) {
        return super.transfer(receiver, quantity);
    }
}
