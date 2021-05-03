pragma solidity ^0.4.10;

contract GaslessSend {
    address owner;
    // 設定所有權為發送訊息的人
    function GaslessSend () payable public{
        owner=msg.sender;
    }
    // 使用 send()方式付款
    function pay(uint n, address d) public {
        d.send(n);
    }
    // 查看帳務
    function getBalance() constant returns(uint){
        return this.balance;
    }
}
