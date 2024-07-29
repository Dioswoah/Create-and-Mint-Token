# Create-and-Mint-Token-Project

This project highlights the creation of an ERC-20 token smart contract, featuring Minting, Burning, and Transferring capabilities.

## Description
The contract provides mint, burn, and transfer functionalities. The mint function is exclusively for the owner, while any user can perform burning and transferring of tokens.

## Getting Started
### Running the Program
You can use Remix Ethereum to test and understand the contract's features.

1. Add a new file by clicking the "+" icon in the left sidebar.
2. Copy and paste the following code into this file:

```solidity
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
```

3. Click the compile button under the Solidity Compiler tab.
4. Once compiled, navigate to the Deploy and Run Transactions tab to deploy the contract.
5. Fill in the required fields before initiating the transaction. The contract will appear in the Deployed/Unpinned Contracts section after deployment.
6. Play around with the values to see how minting, burning, and transferring function.
7. Change accounts to test different functionalities. By default, the first account is the owner and has access to minting, while other accounts can only burn and transfer tokens.

## Authors
Marc Joshua Ramos
