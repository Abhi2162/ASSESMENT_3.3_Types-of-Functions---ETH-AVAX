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
