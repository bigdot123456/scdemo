pragma solidity >0.4.0 <0.7.0;

contract InfoContract {

    string fName;
    uint age;

    function setInfo(string memory _fName, uint _age) public {
        fName = _fName;
        age = _age;
    }

    function getInfo() public view returns (string memory, uint) {
        return (fName, age);
    }
}
