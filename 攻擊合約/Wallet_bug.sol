contract Wallet {
    address _walletLibrary;
    address owner;

    function Wallet(address _owner) {
        // replace the following line with “_walletLibrary = new WalletLibrary();”
        // if you want to try to exploit this contract in Remix.
        _walletLibrary = <address of pre-deployed WalletLibrary>;
        _walletLibrary.delegatecall(bytes4(sha3("initWallet(address)")), _owner);
    }

    function withdraw(uint amount) returns (bool success) {
        return _walletLibrary.delegatecall(bytes4(sha3("withdraw(uint)")), amount);
    }

    // fallback function gets called if no other function matches call
    function () payable {
        _walletLibrary.delegatecall(msg.data);
    }
}