// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract ProofOfCharacter {
    event Add(address owner, string character);

    event BuyError(address from, string text, string reason);

    function buy_character(string memory character) public payable {
        if (msg.value != 0.0001 ether) {
            emit BuyError(
                msg.sender,
                character,
                "Incorrect amount of Ether. 0.0001 ether for buy the character."
            );
            payable(msg.sender).transfer(msg.value);
            return;
        }
        emit Add(
            msg.sender,
            character
        );
    }
}
