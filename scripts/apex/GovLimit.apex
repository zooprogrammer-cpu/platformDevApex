List <Opportunity> oppRecords = [SELECT Id, Name, Profile__c, Amount FROM Opportunity]; 
List<Id> oppIds = new List<Id>(); 

for (Opportunity opp: oppRecords){
    oppIds.add(opp.Id);
}

OpportunityController.updateProfileValue(oppIds);


