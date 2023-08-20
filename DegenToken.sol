// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") {}

    function mint(address _add, uint256 _amt) public onlyOwner {
         _mint  (_add , _amt);
    }

    function trans_Tks(address _acc, uint _amt) external {
        require(balanceOf(msg.sender) >= _amt, "Insufficient balance");
        _transfer(msg.sender, _acc, _amt);
    }

    function bal_get() external view returns (uint) {
        return balanceOf(msg.sender);
    }

    function bal_Tks(uint _amt) external {
        require(balanceOf(msg.sender) >= _amt, "Insufficient tokens");
        _burn(msg.sender, _amt);
    }

    function Tks_game() public pure returns (string memory) {
        return "1.ONE GAME WON Tokens=100\n2.TWO GAME WON Tokens=250\n3.THREE GAME WON Tokens=500\n4.FOUR GAMES WON Tokens=1000\n";
    }

    function redeemTokens(uint gameswon) external {
    require(gameswon > 0 && gameswon <= 4, "Invalid input");

    uint Tks_redem;

    if (gameswon == 1) {
        Tks_redem = 100;
    } 
    if (gameswon == 2) {
        Tks_redem = 250;
    } 
    if (gameswon == 3) {
        Tks_redem = 500;
    } 
    if (gameswon == 4) {
        Tks_redem = 1000;
    } 
    else {
        revert("Invalid input");
    }

    require(balanceOf(msg.sender) >= Tks_redem, "Insufficient tokens");

    _transfer(msg.sender, owner(), Tks_redem);

    console.log(Tks_redem, "tokens have been successfully transferred");
}

}
