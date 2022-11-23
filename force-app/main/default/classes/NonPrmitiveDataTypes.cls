public with sharing class NonPrmitiveDataTypes {
    public NonPrmitiveDataTypes() {
        //List - Used to store an ordered collection of elements
        List<Double> opportunityAmounts = new List<Double>{2343,3453,3454.46};
        System.debug(opportunityAmounts);

        //Set - used to store unique collection of elements
        Set<Id> accountIds = new Set<Id>();

        //Map - Used to store key -value pairs of elements
        Map<Integer, String> productMap = new Map<Integer, String>{11=>'Laptop E42343', 12 =>'Mouse 4000'};
        Map<Id, Opportunity> opportunityMap = new Map<Id, Opportunity>([SELECT Id,Name, StageName FROM Opportunity LIMIT 2]);
        System.debug(opportunityMap); //prints key-value pair with key as Opportunity Record Id

        //Enum - used to define a set of possible values
        //Enum daysOfWeek {Sunday,Monday,Tuesday};

        //sObject - Used to store a record of an object
        SObject accObj = new Account(); 

        //Class Object - used to access class methods and varaibles
        Account acc = new Account(Name = 'Test Account');

    }
}
