pragma solidity ^0.5.1;

contract User{
    address internal _userAddress;
    uint internal userId;
    
    struct user{
    string name;
    uint amount;
    string status;
    }
    
    mapping (address => user) adressToUser;
    mapping (uint => address) UserToAddress;
    
    user[] public users;
    
    function setUserAddress(address userAddress) public{
         _userAddress = userAddress;
    }
    
    function makeUser(string memory _name, uint _amount, string memory _status) public{
        userId = users.push(user(_name, _amount, _status))-1;
        adressToUser[_userAddress] = user({name: _name, amount:_amount, status:_status});
        UserToAddress[userId] = _userAddress;
    }
    
    function getUserId() public view returns(uint){
        return userId;
    }
}