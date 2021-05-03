
pragma solidity ^0.4.10;

contract PresidentOfCountry {
    address public president;
    uint256 price;

    function PresidentOfCountry(uint256 _price) {
        require(_price > 0);
        price = _price;
        president = msg.sender;
    }

    function becomePresident() payable {
        // must pay the price to become president
        require(msg.value >= price); 
        // we pay the previous president
        president.transfer(price);   
        // we crown the new president
        president = msg.sender; 
        // we double the price to become president     
        price = price * 2;           
    }
}