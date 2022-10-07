List<Account> accountsToAdd = new List <Account>();

Account acc6 = new Account (Name ='Test Account 6', Phone = '23432432');
Account acc7 = new Account (Name ='Test Account 7', Phone = '543534544');
Account acc8 = new Account (Name ='Test Account 8', Phone = '2342342343');
Account acc9 = new Account (Name ='Test Account 9', Phone = '546546546');


 
accountsToAdd.add(acc6);
accountsToAdd.add(acc7);
accountsToAdd.add(acc8);
accountsToAdd.add(acc9);


Database.insert(accountsToAdd);




