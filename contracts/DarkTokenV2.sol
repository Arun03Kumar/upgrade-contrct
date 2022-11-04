// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20CappedUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";


contract DarkTokenV2 is Initializable, ERC20CappedUpgradeable  {
    address payable public owner;

    function initialize(uint256 cap) initializer public {
        __ERC20_init("DarkToken", "DKT");
        __ERC20Capped_init(cap * (10 ** decimals()));
        owner = payable(msg.sender);
        _mint(owner, 700000 * (10 ** decimals()));
    }

    function mint(address account, uint256 amount) public {
        require(totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        _mint(account, amount);
    }
}