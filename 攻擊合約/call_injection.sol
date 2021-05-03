pragma solidity ^0.4.22;
contract Victim {
    uint256 public balance = 1;
    
    function info(bytes4 data){
        this.call(data);
        //this.call(bytes4(keccak256("secret()"))); //  借用原有的程式碼
    }
    function secret() public{
        require(this == msg.sender);
        // secret operations
        balance = 100;
    }
}