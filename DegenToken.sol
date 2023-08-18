// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") {}

        function mint(address addressof, uint256 _amt) public onlyOwner{
            _mint(addressof, _amt);
        }
        function transferTokens(address beneficiary, uint _amt) external{
            require(balanceOf(msg.sender) >= _amt, "Invalid Owner !!");
            approve(msg.sender,_amt);
            transferFrom(msg.sender, beneficiary,_amt);
        }
        function balanceGetter() external view returns(uint){
           return balanceOf(msg.sender);
        }
        function burnTokens(uint _amt) external{
            require(balanceOf(msg.sender)>= _amt, "Insufficient Tokens Present");
            _burn(msg.sender,_amt);
        }
        function gaminghub() public pure returns(string memory) {
            return "1.ONE GAME WON  NFT=100\n 2.TWO GAME WON NFT=250 \n 3.THREE GAME WON NFT=500 \n 4.MORE THAN THREE GAMES WON NFT=1000 \n";
        }
      

        function reedemTokens(uint gameswon) external payable{
            require(choice>0,"Wrong Input");
            if(gameswon ==1){
                approve(msg.sender, 100);
                transferFrom(msg.sender, owner(), 100);
                console.log("Congrats you have redeemed 100 tokens ");
            }
            else if(gameswon ==2){
                approve(msg.sender, 250);
                transferFrom(msg.sender, owner(), 250);
                 console.log("Congrats you have redeemed 250 tokens ");
            }
            else if(gameswon ==3){
                approve(msg.sender, 500);
                transferFrom(msg.sender, owner(), 500);
                 console.log("Congrats you have redeemed 500 tokens ");
            }
          else if(gameswon>3){
                approve(msg.sender, 1000);
                transferFrom(msg.sender, owner(), 1000);
                 console.log("Congrats you have redeemed 1000 tokens ");
            }
        }

}
