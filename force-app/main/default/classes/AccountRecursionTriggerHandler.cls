public with sharing class AccountRecursionTriggerHandler {
   public static void updateRelatedRatings(List<Account> newAccounts, Map<Id, Account> oldMap, Map<Id, Account> newMap ) {
    // Use Map instead of List to avoid getting duplicate parent records during update  
    Map<Id,Account> updateMap = new Map<Id, Account>(); 

    //update parent records
    for (Account newAcct : newList) {
        System.debug('ACCOUNT RECORD: ' + newAcct.Name); 
        if (newAcct.ParentId != null) {
            System.debug('update parent Id ' + newAcct.ParentId + 'rating to ' + newAcct.Rating + 'from child');
        }
    }
   }
}
