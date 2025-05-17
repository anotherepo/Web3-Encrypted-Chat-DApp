pragma solidity ^0.8.0;

contract Chat {
    struct Message {
        address sender;
        string content;
        uint256 timestamp;
        bool isDeleted;
    }

    mapping(address => mapping(address => Message[])) private messages;

    event MessageSent(address indexed from, address indexed to, string content);
    event MessageDeleted(address indexed from, address indexed to, uint256 index);

    function sendMessage(address to, string memory content) public {
        messages[msg.sender][to].push(Message(msg.sender, content, block.timestamp, false));
        emit MessageSent(msg.sender, to, content);
    }

    function getMessages(address withUser) public view returns (Message[] memory) {
        return messages[msg.sender][withUser];
    }

    function deleteMessage(address withUser, uint256 index) public {
        require(index < messages[msg.sender][withUser].length, "Invalid index");
        require(messages[msg.sender][withUser][index].sender == msg.sender, "Not your message");

        messages[msg.sender][withUser][index].isDeleted = true;
        emit MessageDeleted(msg.sender, withUser, index);
    }
}
