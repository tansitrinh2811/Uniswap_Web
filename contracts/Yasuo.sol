// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Yasuo is ERC20, Ownable {
    
    constructor() ERC20("Yasuo", "YAS") {
        _mint(msg.sender, 800000*10**decimals());
        }
}
