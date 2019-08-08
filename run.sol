pragma solidity > 0.4.0  < 0.70 ;

contract run {
    // address myAddress = this;

    event logdata(bytes data);
    function() payable external {
        emit logdata(msg.data);
    }

    function getBalance() public returns (uint) {
        return address(this).balance;
    }

    uint score = 0;
    function setScore(uint s) public {
        score = s;
    }

    function getScore() public returns ( uint){
        return score;
    }
}

contract CallTest{
    function deposit() public payable {
    }

    event logSendEvent(address to, uint value);
    function transferEther(address payable towho) public payable {
        towho.transfer(10);
        emit logSendEvent(towho, 10);
    }

    function callNoFunc(address addr) public returns (bool){
        bool result;
        result=addr.call("tinyxiong", 1234);
        return result;
    }

    function callfunc(address addr) public returns (bool){
        bytes4 methodId = bytes4(keccak256("setScore(uint256)"));
        return addr.call(methodId, 100);
    }

    function getBalance() public returns (uint) {
        return address(this).balance;
    }
}
