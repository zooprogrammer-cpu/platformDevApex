public class AccountController {
    public static Account insertAccount( Account accountToInsert) {
        insert accountToInsert;
        return accountToInsert; 
    }

    public static List<Account> insertAccounts(List<Account> accountsToInsert) {
        insert accountsToInsert;
        return accountsToInsert; 
    }

    public static List<Account> getAllAccounts(){
        // Retreive all accounts and assign to a List Collection
        List<Account> accounts = [SELECT Id,Name, Phone FROM Account];
        return accounts; 
    }
    //using void here since we are not returning anything
    public static void printAllAccounts(){
        // Retreive all accounts and assign to a List Collection
        List<Account> accounts = getAllAccounts();
        // iterate over all accounts and print account information 
        for(Account account : accounts){
            System.debug('Account Name: ' + account.Name + ' Account Phone: ' + account.Phone);
        }
    }

    public static Integer getAccountSize(){
        List<Account> accounts = getAllAccounts();
        return accounts.size();

    }

    public static List<Account> getAccountsToUpdate(){
        // Retreive all accounts and assign to a List Collection
        List<Account> accounts = [SELECT Id,Name, Phone FROM Account WHERE Name = 'sForce'];
        return accounts; 
    }

    public static void updateAccounts(){
        // Retreive all accounts and assign to a List Collection
        List<Account> accounts = getAccountsToUpdate();
        for(Account account : accounts){
            account.Name = 'sForce';
            account.Rating = 'Warm';
        }
        //update accounts;
        //OR
        Database.update(accounts,true);
    }

 

}
