pragma solidity >=0.4.20 <0.7.0;
contract DrugTracking {
//core function is to track drugs between owners of the drug
// allow certain manufctures to register the drug 
//get current owener of the drug
//cherck if the drug has already been consumed , retail , warehouse 
//get the drug previos owners
// writing events registering manu , creating drug  , change ownership

      // code 

      // state variables 
      address public owner;
      uint public manufacturersCount = 0 ;
      uint public drugsCount = 0;
      // track drug information 
      Drug[] public drugTrack ;
       
      



      // struct representation of pharmaceutical drug 
        struct Drug {
         uint serialNumber;
         //national drug code
         uint ndc;
         string name;
         string manufacturerName;
         address currentOwner ;
         
   

        } 
        struct Manufacturer {
          uint id;
          string name;
          address account;




        }
        struct pharmacy {
          uint id;
          string name;
         address account;


        }
        //all registered manufacturers 
        mapping(uint => Manufacturer) public manufacturers;

        // all drugs in the supply chain get the last onwer 
        mapping(uint => Drug) public drugs ;
        // Drug and current owner mapping , get the drugs in the supply chain exchaining hands

        mapping(address => mapping(uint => Drug)) public ownerships ;
       

        
        constructor() public {
           owner = msg.sender; 

        }
        function registerManufacturer(uint  _id , string memory _name , address   _account) payable public{
            require(msg.sender == owner , "you are not authorized to register Manufacturers") ;
            manufacturers[_id] = Manufacturer(_id , _name, _account ) ;
            manufacturersCount ++;
        }
        
        function createDrug(uint _serialNumber , uint _ndc , string memory _name , string memory _manufacturerName)  internal {
            
         drugs[_serialNumber] = Drug(_serialNumber , _ndc, _name ,_manufacturerName ,msg.sender) ;
         ownerships[msg.sender][_serialNumber] = Drug(_serialNumber , _ndc, _name,_manufacturerName,msg.sender) ;
         drugsCount ++ ;              



        }
        function registerDrug(uint _serialNumber , uint _ndc , string memory _name , string memory _manufacturerName) payable public{
           
          uint i = 0 ;

          while ( i <= manufacturersCount) {
          Manufacturer memory cherck =  manufacturers[i] ;
          i ++ ;
          if(cherck.account == msg.sender) {
            createDrug(_serialNumber ,_ndc ,_name ,_manufacturerName) ;
          }
          
          }
          
        }

        // function to tranfer drugs between maunfacture and other 
       // get the drug change current owener
       // create an array  to push in the the next owner

       function changeOwnership(uint _serialNumber , address _newOwner)payable public{
          Drug storage currentDrug = drugs[_serialNumber] ;
         drugTrack.push(currentDrug);
         require(msg.sender == currentDrug.currentOwner  , "you`re not the owner of this drug") ;
         currentDrug.currentOwner = _newOwner ;
         drugTrack.push(currentDrug);

       }





}