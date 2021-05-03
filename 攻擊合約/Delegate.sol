
pragma solidity ^0.4.10;
contract Delegate {
    address public owner;
    function Delegate(address _owner) {
        owner = _owner;
    }
    function setOwner() {
        owner = msg.sender;
    }
}
contract Delegation {    // 外部呼叫時會透過這邊進行 
    address public owner;
    Delegate delegate;
    function Delegation(address _delegateAddress) {
        delegate = Delegate(_delegateAddress);
        owner = msg.sender;
    }
    function () {
        if (delegate.delegatecall(bytes4(keccak256("setOwner()")))) {
            this;
        }
    }
}