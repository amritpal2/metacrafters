// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    uint public totalSupply;

    mapping(address => uint) public balances;

    constructor(string memory _name, uint _totalSupply) {
        name = _name;
        totalSupply = _totalSupply;
        balances[msg.sender] = totalSupply;
    }

    function mint(address _to, uint _value) public {
        require(_to != address(0), "Invalid address");
        totalSupply += _value;
        balances[_to] += _value;
    }

    function burn(address _from, uint _value) public {
        require(_from != address(0), "Invalid address");
        require(_value <= balances[_from], "Insufficient balance");

        totalSupply -= _value;
        balances[_from] -= _value;
    }
}
