
pragma solidity ^0.4.10;
contract MyToken {
    mapping (address => uint) balances;
    
    event balancesAndAmount(uint, uint);
    function balanceOf(address _user) returns (uint) { return balances[_user]; }
    function deposit() payable { balances[msg.sender] += msg.value; }
    function withdraw(uint _amount) {
        balancesAndAmount(balances[msg.sender], _amount);
        require(balances[msg.sender] - _amount > 0);  // 整數溢位
        msg.sender.transfer(_amount);
        balances[msg.sender] -= _amount;
    }
}