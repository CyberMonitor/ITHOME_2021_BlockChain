pragma solidity ^0.4.10;
contract SevenToken {
  address owner;
  mapping (address => uint256) balances;  // 存入者的資產資訊
  event withdrawLog(address, uint256);
  function SevenToken() { owner = msg.sender; }
  function deposit() payable { balances[msg.sender] += msg.value; }
  function withdraw(address to, uint256 amount) {
      require(balances[msg.sender] > amount);
      require(this.balance > amount);
      withdrawLog(to, amount);  // 印出紀錄 用來觀察 re-entrancy 情況
      to.call.value(amount)();  // 使用 call.value()() 進行 ether 轉帳時, 預設把所有的Gas都發給外面
      balances[msg.sender] -= amount; // 這個順序有問題, 應該 send token 之前就要處理
  }
  function balanceOf() returns (uint256) { return balances[msg.sender]; }
  function balanceOf(address addr) returns (uint256) { return balances[addr]; }
}