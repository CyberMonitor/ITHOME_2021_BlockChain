
contract Alice{
    uint256 public n = 0;
    
    function pong() public{
        n = n + 1;
        revert();
    }
}