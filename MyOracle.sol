pragma solidity >0.4.0 <0.70;

contract Oracle {
    struct Request {
        bytes data;
        function(bytes memory) external callback;
    }
    Request[] requests;
    event NewRequest(uint);
    function query(bytes memory data, function(bytes memory) external callback) public {
        requests.push(Request(data, callback));
        emit NewRequest(requests.length - 1);
    }
    function reply(uint requestID, bytes memory response) public {
        // Here goes the check that the reply comes from a trusted source
        requests[requestID].callback(response);
    }
}

contract OracleUser {
    Oracle constant oracle = Oracle(0x1234567); // known contract
    function buySomething() public {
        oracle.query("USD", this.oracleResponse);
    }
    function oracleResponse(bytes memory response) public view {
        require(msg.sender == address(oracle));
        // Use the data
    }
}
