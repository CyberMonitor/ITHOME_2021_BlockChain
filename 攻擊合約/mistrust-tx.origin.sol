
pragma solidity ^0.4.18;


contract TxOriginVictim {
    address public owner;
    function TxOriginVictim() payable{
      owner = msg.sender;
    }
    function transferTo(address to, uint amount) public {
      require(tx.origin == owner);
      to.call.value(amount)();
    }
    function() payable public {}
    
    function getBalance() public constant returns (uint256) {
        return this.balance;
    }
}