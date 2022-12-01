public with sharing class DatabaseClassMethods {
  public static void databaseDemo() {
    Savepoint sp = Database.setSavepoint();

    Integer numAccts = [SELECT COUNT() FROM Account];
    System.debug('Total accounts before insert/update: ' + numAccts);

    List<Account> newOnes = new List<Account>();
    newOnes.add(new Account(Name = 'New 1'));
    newOnes.add(new Account(Name = 'New 2'));

    List<Account> existing = [SELECT Id FROM Account WHERE Rating = NULL];

    for (Account nextAcct : existing) {
      nextAcct.Rating = 'Cold';
    }

    insert newOnes;
    // after insert, each element in newOnes now has a record Id in it
    update existing;

    numAccts = [SELECT COUNT() FROM Account];
    System.debug('Total accounts after insert/update: ' + numAccts);

    delete newOnes;

    numAccts = [SELECT COUNT() FROM Account];
    System.debug('Total accounts after delete: ' + numAccts);

    undelete newOnes;

    numAccts = [SELECT COUNT() FROM Account];
    System.debug('Total accounts after undelete: ' + numAccts);

    // in the merge, the first record become the master record
    merge newOnes[0] newOnes[1];

    numAccts = [SELECT COUNT() FROM Account];
    System.debug('Total accounts after merge: ' + numAccts);

    Database.rollback(sp); // this does not seem to be doing anything
    System.debug('Total accounts after rollback: ' + numAccts);
  }

  public static void partialSuccess() {
    Savepoint sp = Database.setSavepoint();

    List<Account> records = new List<Account>{
      new Account(Name = 'St. John'), // this record gets inserted
      new Account() // this will fail since Name field is required
    };

    // Insert database method is used here to insert records
    // The result of each record is stored in a SaveResult object
    Database.SaveResult[] results = Database.insert(records, false); // false makes partial success ok

    for (Database.SaveResult result : results) {
        if (result.isSuccess()) {
            System.debug('Id of newly created record: ' + result.getId());
        }    else {
            // Retreive the errors that were encountered
            for (Database.Error err : result.getErrors()) {
                System.debug(err.getStatusCode() + ' : ' + err.getMessage());
                System.debug('Field errors: ' + err.getFields());
            }
        }
    }
  }
}
