// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenSwap {

    IERC20 public token1;
    IERC20 public token2;

    constructor(IERC20 _token1, IERC20 _token2) {
        token1 = _token1;
        token2 = _token2;
    }

    function depositToken1(uint256 amount) public {
        // O usuário deve ter aprovado esta transferência primeiro
        require(token1.transferFrom(msg.sender, address(this), amount), "Transfer of token1 failed");
    }

    function depositToken2(uint256 amount) public {
        // O usuário deve ter aprovado esta transferência primeiro
        require(token2.transferFrom(msg.sender, address(this), amount), "Transfer of token2 failed");
    }

    function swap(uint256 amount) public {
        // O usuário deve ter aprovado esta transferência primeiro
        require(token1.transferFrom(msg.sender, address(this), amount), "Transfer of token1 failed");
        require(token2.transfer(msg.sender, amount), "Transfer of token2 failed");
    }
}