pragma solidity ^0.4.18;

contract BCCamp {
    
// Declare variables that will store information of BlockChain mini boot camp students, this information includes name, age, 
// and if he/she is enjoying or not, every student information should be bound with his/her ethereum account address.
    
// your code here
    struct Student{
        string name;
        uint age;
        bool isEnjoying;
    }

    mapping(address => Student) public Students;

    function addStudent(address _account, uint _age, string name, bool _isEnjoying) public {
       // your code here
       Students[_account]=Student(name,_age,_isEnjoying);
    }


    // build getStudents() function


    // build getStudent(address _address) function
    function getStudent(address _address) view returns(string , uint,bool){
        Student st = Students[_address];
        return (st.name,st.age,st.isEnjoying);
    }



    // build countStudents() function
  

    
}