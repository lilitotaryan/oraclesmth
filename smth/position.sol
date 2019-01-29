pragma solidity ^0.5.1;
import "./user.sol";

contract Position is User{
    
        uint internal key;
        string internal discription;
        string internal positionName;
        uint internal salary;
        bool internal positionStatus; 
        
    
    mapping (address => uint) EmployerToPosition;
    mapping (uint => address) PositionToEmployer;
   
   
    function makePosition (string memory _discription, string memory _positionName, uint _salary) public{
        key = uint(keccak256(abi.encodePacked(_discription, _positionName, _salary, false)));
        discription = _discription;
        positionName = _positionName;
        salary = _salary;
        positionStatus = false;
        EmployerToPosition[_userAddress] = key;
        PositionToEmployer[key] = _userAddress;
    }
    
    function applyForPosition () public payable{
            positionStatus = true;
        }
    
    
   function deletePosition() public{
        delete PositionToEmployer[key];
        delete EmployerToPosition[_userAddress];
    }
    function getEmployerToPosition() public view returns (uint){
        return EmployerToPosition[_userAddress];
    }
    
    function getPositionToEmployer() public view returns (address){
        return PositionToEmployer[key];
    }
    
    function getPositionStatus() public view returns (bool){
        return positionStatus;
    }
}