public class AccountController {
  public static Account insertAccount(Account accountToInsert) {
    insert accountToInsert;
    return accountToInsert;
  }

  public static List<Account> addAccounts() {
    List<Account> accountsToAdd = new List<Account>();
    Account acc6 = new Account(Name = 'Test Account 6', Phone = '23432432');
    Account acc7 = new Account(Name = 'Test Account 7', Phone = '543534544');
    Account acc8 = new Account(Name = 'Test Account 8', Phone = '2342342343');
    Account acc9 = new Account(Name = 'Test Account 9', Phone = '546546546');

    accountsToAdd.add(acc6);
    accountsToAdd.add(acc7);
    accountsToAdd.add(acc8);
    accountsToAdd.add(acc9);

    return accountsToAdd;
  }

  public static List<Account> insertAccounts() {
    List<Account> accounts = addAccounts();
    insert accounts;
    return accounts;
  }

  public static List<Account> getAllAccounts() {
    // Retreive all accounts and assign to a List Collection
    List<Account> accounts = [SELECT Id, Name, Phone FROM Account];
    return accounts;
  }
  //using void here since we are not returning anything
  public static void printAllAccounts() {
    // Retreive all accounts and assign to a List Collection
    List<Account> accounts = getAllAccounts();
    // iterate over all accounts and print account information
    for (Account account : accounts) {
      System.debug(
        'Account Name: ' +
        account.Name +
        ' Account Phone: ' +
        account.Phone
      );
    }
  }

  public static Integer getAccountSize() {
    List<Account> accounts = getAllAccounts();
    return accounts.size();
  }

  public static List<Account> getAccountsToUpdate() {
    // Retreive all accounts and assign to a List Collection
    List<Account> accounts = [
      SELECT Id, Name, Phone
      FROM Account
      WHERE Name = 'sForce'
    ];
    return accounts;
  }

  public static void updateAccounts() {
    // Retreive all accounts and assign to a List Collection
    List<Account> accounts = getAccountsToUpdate();
    for (Account account : accounts) {
      account.Name = 'sForce';
      account.Rating = 'Warm';
    }
    //update accounts;
    //OR
    Database.update(accounts, true);
  }
}
