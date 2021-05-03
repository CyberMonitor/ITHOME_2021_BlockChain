
contract Alice{
    function random() internal returns (uint8){
        return 11;
    }

    function guess(uint8 num) payable public returns (bool){
        require(msg.value >= 1 ether);
        
        uint8 rand = random();
        if(num > rand-3 && num < rand+3){
            msg.sender.transfer(2 ether);
        }
        else{
          return false;
        }
    }
}