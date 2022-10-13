List<Id> accountIds = new List<Id>(); 

for (Account acc : [SELECT Id FROM Account]){
    accountIds.add(acc.Id);    
}

AccountController.updateAvgCaseResolutionDays(accountIds);