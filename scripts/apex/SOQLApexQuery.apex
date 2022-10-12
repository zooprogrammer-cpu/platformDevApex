//Create new instance of account Object
Account newAcc = new Account (Name = 'IFC Films', Rating = 'Warm');
// insert the account
insert newAcc; 

Opportunity newOpp = new Opportunity(AccountId = newAcc.Id, Name ='Lord of the Rings', StageName = 'Qualification', CloseDate = Date.Today());
insert newOpp;
//retreive wingnut films account
Account account = [SELECT Id, Name FROM Account WHERE Name= 'IFC Films' LIMIT 1]; 
//update the name 
account.Name = 'New Line Cinema';
//update the account
update account; 

//update Opportunity stage
Opportunity opp = [SELECT Id FROM Opportunity WHERE Name = 'Lord of the Rings' LIMIT 1];
opp.StageName = 'Closed Won';
update opp; 

// get opp to delete
// Opportunity opp = [SELECT Id FROM Opportunity WHERE Name = 'Lord of the Rings' LIMIT 1];
// delete opp; 

//undelete the opp
//this is not working- 
//List <Opportunity> deletedOpps = [SELECT Id FROM Opportunity WHERE isDeleted = TRUE ALL ROWS];

// undelete the list of records
//undelete deletedOpps;
