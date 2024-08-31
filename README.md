# My token: DEWATOKEN
The **DEWATOKEN** initiative launches an **ERC20** token, known as DEWATOKEN (DKN), on the Ethereum network. Utilizing OpenZeppelin’s well-established and secure contracts, the project guarantees a robust and reliable system for managing tokens. These contracts provide essential functionalities, including the ability to mint, burn, and transfer tokens, ensuring both security and efficiency in token operations.
## Description
This project is written in Solidity programming language which is mostly used language for building smart contracts. The motivation behind creating this project was to create my own token and understand all the basic things about ERC tokens and their functionalities. This smart contract leverages the OpenZeppelin library to ensure robust and secure token functionality. This contract inherits the functionalities of ERC20 and ownable smart contracts of OpenZeppelin library and override some of them functions according to our needs. The ERC20 library is used to create tokens and perform operations on them like mint, burn, transfer, allowance, approve etc. And the ownable smart contract is basically used to work with the ownership of the smart contract inheriting it. The smart contract provides the following features:

**Minting:** Only the contract owner can mint new tokens, allowing controlled token issuance.

**Burning:** Any user can burn their tokens, reducing the total supply.

**Transfer:** Standard token transfer functionality is implemented, allowing users to transfer tokens between addresses.

## Getting Started
### Executing Program
To execute this program you can go to the Remix IDE which is open IDE for Solidity. For that you can click on this link https://remix.ethereum.org/

Once you successfully reached to the IDE create a new file by clicking on the '+' icon and saving that file with .sol extension (e.g. DEWATOKEN.sol). After this copy and paste the code in your file that is given below 

```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DEWATOKEN is ERC20, Ownable {
    string private constant NAME = "DEWATOKEN";
    string private constant SYMBOL = "DWK";

    constructor() ERC20(NAME, SYMBOL) Ownable(msg.sender) {
        _mint(msg.sender, 5000 * 10 ** decimals());
    }

    function mintTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        uint256 senderBalanceBefore = balanceOf(msg.sender);
        require(senderBalanceBefore >= amount, "Insufficient balance for transfer");

        bool success = super.transfer(recipient, amount);
        require(success, "Transfer failed");


        uint256 senderBalanceAfter = balanceOf(msg.sender);
        uint256 recipientBalanceAfter = balanceOf(recipient);

        // Emit an event with the balances (optional)
        emit TransferDetails(msg.sender, recipient, senderBalanceBefore, senderBalanceAfter, recipientBalanceAfter);

        return true;
    }

    event TransferDetails(
        address indexed sender,
        address indexed recipient,
        uint256 senderBalanceBefore,
        uint256 senderBalanceAfter,
        uint256 recipientBalanceAfter
    );
}


    

```

After pasting this code you have to compile the code from the left hand sidebar. click on the 'Solidity Compiler' then click on the 'Compile DEWATOKEN.sol' button.

After the successful compilation of the code you have to deploy the program. For that you have again another option on the left sidebar that is 'Deploy & Run Transactions' and then you will see a deploy button; before clicking on it make sure that the file showing there is 'DEWATOKEN.sol'. Then you will be able to see the file in the 'Deployed/Unpinned Contracts' click on that now all the public variable and functions are visible to you now execute and fetch the values according to you. And be aware that here you will see the function that you have neither created nor implemented, these extra functions are the functions of the libraries we have inherited (ERC20 and ownable) and it is up to you that you gonna use them or not.

## Authors
Abhinesh kumar

## License
This project is licensed under the MIT license.
