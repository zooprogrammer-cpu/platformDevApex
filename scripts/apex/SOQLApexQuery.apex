List<String> accountNames = new List<String>();
accountNames.add('sForce');
accountNames.add('University of Arizona');

List<Account> accounts = [SELECT Id,Name,Rating FROM Account 
                          WHERE Name IN ('sForce', 'University of Arizona')];

// List<Account> accounts = [SELECT Id,Name,Rating FROM Account 
// WHERE Name IN ('University of Arizona')];

//Instead of repeating the code like above with each account name, 
//Bind variables lets us use the accountNames variable in Apex

// List<Account> accounts = [SELECT Id,Name,Rating FROM Account 
//                           WHERE Name IN:accountNames];

System.debug('Account Size: ' + accounts.size());


