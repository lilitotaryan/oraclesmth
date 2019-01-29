pragma solidity ^0.5.1;
import "./position.sol";

contract Payement is Position{
    
  function transfer(uint _from, uint _to) public{
     require(keccak256(abi.encodePacked(users[_from].status)) == keccak256(abi.encodePacked("employee")) && keccak256(abi.encodePacked(users[_to].status)) == keccak256(abi.encodePacked("employer")));
     require(users[_from].amount >= salary);
     require(positionStatus == true);
     users[_to].amount+=salary;
     users[_from].amount-=salary;
     deletePosition();
  }
  
}