public with sharing class SoqlWithRelationship {
  public static List<Account> parentWithChildren(
    Integer parentLimit,
    Integer childLimit
  ) {
   
    List<Account> accounts = [
      SELECT
        Name,
        AccountSource,
        (SELECT Name FROM Previous_Contacts__r LIMIT :childLimit)
      FROM Account
      LIMIT :parentLimit
    ];
    //iterate through outer loop and any account that has child records, 
    //reference those child records as if they were a list of contacts
    for (Account acc : accounts) {
        for (Contact con : acc.Previous_Contacts__r) {
            System.debug(con); // do whatever processing that needs to be done here
        }
    }
    return accounts;
  }

  public static List <Account> processAccounts() {
    for (Account acc : [SELECT Id, Name FROM Acount]) {
        //do something here    
    }  
  }
}
