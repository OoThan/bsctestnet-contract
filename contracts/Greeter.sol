// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Greeter {
    string private _greeting = "Hello, World.";

    address private _owner;

    constructor() {
        _owner = msg.sender;
    }

    modifier restricted() {
        require(
            msg.sender == _owner,
            "This function is restricted to the contract's owner."
        );
        _;
    }

    function greet() external view returns (string memory) {
        return _greeting;
    }

    function setGreeting(string calldata greeting) external restricted {
        _greeting = greeting;
    }

    function owner() public view returns (address) {
        return _owner;
    }
}
