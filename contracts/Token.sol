//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token {
    string public name = 'Jaribu Hard Hat Token';
    string public symbol = 'JHHT';
    uint public totalSupply = 1000000;
    
    // The owner of the contract/ Ethereum account.
    address public owner;

    // The balance of each account.
    mapping(address => uint) public balances;

    // The Transfer event helps off-chain applications understand
    // what happens within your contract.
    event Transfer(address indexed _from, address indexed _to, uint amount);

    // Initialize the contract.
    constructor(){
        // The totalSupply is assigned to the transaction sender, which is the
        // account that is deploying the contract.
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    function transfer(address _to, uint _amount) external {
        require(balances[msg.sender] >= _amount, 'Not enough tokens');
        require(_to != address(0), 'To address cannot be zero');

        console.log(
        "Transferring from %s to %s %s tokens",
        msg.sender,
        _to,
        _amount
    );

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;

        // Notify the Transfer event to off-chain appplications.
        emit Transfer(msg.sender, _to, _amount);
    }
    /**
     * Read only function to retrieve the token balance of a given account.
     *
     * The `view` modifier indicates that it doesn't modify the contract's
     * state, which allows us to call it without executing a transaction.
     */
    function balanceOf(address account) external view returns (uint) {
        return balances[account];
    }
}

// 0xeD44aaDf224202d3774F41aDA91D0b86FA692F22