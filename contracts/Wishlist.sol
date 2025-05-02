// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Wishlist {
    // Ключ - адрес пользователя, значение - массив строк (его желания)
    mapping(address => string[]) public userWishlists;

    event ItemAdded(address indexed user, string description);

    // Функция добавления желания
    function addItem(string calldata _description) external {
        require(bytes(_description).length > 0, unicode"Описание не может быть пустым");
        // msg.sender - это адрес кошелька, который вызвал эту функцию
        userWishlists[msg.sender].push(_description);
        emit ItemAdded(msg.sender, _description);
    }

    // Функция получения количества желаний пользователя
    function getItemCount(address _user) external view returns (uint256) {
        return userWishlists[_user].length;
    }
}