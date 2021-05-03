
contract faketransfer{

function transfer(address _to, uint256 _value) public returns (bool) {
    if(_value <= balances[msg.sender] && _value > 0){
      balances[msg.sender] -= _value;
      balances[_to] += _value;
      emit Transfer(msg.sender, _to, _value);
      return true;
    }
    else
        return false;
  }

  
}