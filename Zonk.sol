// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Zonk is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 1_000_000_000 * 10**4;

    constructor() ERC20("Zonk", "ZONK") Ownable(msg.sender) {
        _mint(msg.sender, 500_000_000 * 10**4);
    }

    function decimals() public view virtual override returns (uint8) {
        return 4;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Exceeds max supply");
        _mint(to, amount);
    }
}
