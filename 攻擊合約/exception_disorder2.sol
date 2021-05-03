
contract Bob{
    uint256 public x = 0;
    uint256 public y = 0;
    
    function ping1(Alice alice) public returns (uint256)  {
        x = 2;
        alice.pong();
        x = 4;
    }
    

    function ping2(address alice) public returns (uint256)  {
        y = 2;
        alice.call(bytes4(keccak256("pong(uint256)")));
        y = 4;
    }
}