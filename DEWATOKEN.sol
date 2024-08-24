---
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract DEWATOKEN is ERC20, Ownable {
    string private constant NAME = "DEWATOKEN";
    string private constant SYMBOL = "DWK";

    constructor() ERC20(NAME, SYMBOL) {
        // Mint an initial supply of 5000 tokens to the owner's address
        _mint(msg.sender, 5000 * 10 ** decimals());
    }

    function mintTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        return super.transfer(recipient, amount);
    }
}
---
    
