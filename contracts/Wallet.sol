// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Wallet is Ownable {
  constructor()  {
  }


  receive() external payable {}

  function getNativeCoinsBalance() external view returns (uint256) {
    return address(this).balance;
  }

  function getTokenBalance(address _token) external view returns (uint256) {
    return IERC20(_token).balanceOf(address(this));
  }

  function nativeCoinsWithdraw(uint256 _amount) external onlyOwner {
    payable(msg.sender).transfer(_amount);
  }

  function tokenWithdraw(address _token, uint256 _amount) external onlyOwner {
    // IERC20(_token).transfer(msg.sender, _amount);
    SafeERC20.safeTransfer(IERC20(_token), msg.sender, _amount);
  }
}
