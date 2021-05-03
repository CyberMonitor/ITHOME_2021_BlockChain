
// 攻擊組
contract D1 {
    uint public count = 0;
    
    // 有很貴的全域變數 count 的操作
    function() payable external {
        count = count+1;
    }
    
    function getBalance() constant returns(uint){
        return this.balance;
    }
}

// 對這組
contract D2  {
    function() payable external {}
   
    function getBalance() constant returns(uint){
        return this.balance;
    }
}