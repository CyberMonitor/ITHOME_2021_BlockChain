contract WalletLibrary {
     address owner;

     // called by constructor
     function initWallet(address _owner) {
         owner = _owner;
         // ... more setup ...
     }

     function changeOwner(address _new_owner) external {
         if (msg.sender == owner) {
             owner = _new_owner;
         }
     }

     function () payable {
         // ... receive money, log events, ...
     }

     function withdraw(uint amount) external returns (bool success) {
         if (msg.sender == owner) {
             return owner.send(amount);
         } else {
             return false;
         }
     }
}