pragma solidity >0.4.17 <0.70;

contract SimpleStorage1 {
    uint myVariable;

    function set(uint x) public {
        myVariable = x;
    }

    function get() view public returns (uint) {
        return myVariable;
    }
}