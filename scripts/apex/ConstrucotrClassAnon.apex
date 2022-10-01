// create new class instance. Even if constructor is not here,
// Apex creates a new constructor in the background with the empty ()
// need to have a parameter in new ConstructorClass() to make the second constructor class run
//since the second constructor class looks for an Integer to passed to it
ConstructorClass testConstructor = new ConstructorClass(5); 

System.debug(testConstructor.recoveredInArea);

testConstructor.treatPatient();

ConstructorClass.printTreated(); 
