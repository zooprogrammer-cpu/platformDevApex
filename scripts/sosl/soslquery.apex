List<List<sObject>> result = new List<List<Sobject>>();
result = [
  FIND 'Ash'
  IN ALL FIELDS
  RETURNING
    Account(Id, Name, Type WHERE Rating = 'Hot' ORDER BY CreatedDate DESC),
    Lead(Id, Name, Company ORDER BY CreatedDate),
    Contact(Id, Name, Account.Name ORDER BY Account.Name, LastName),
    Opportunity(Id, Name, Account.Name ORDER BY CreatedDate)
];
System.debug('There are ' + result.size() + ' outer lists');

// if the lists are empty, print is empty
for (Integer i = 0; i < result.size(); i++) {
  if (result[i].isEmpty()) {
    System.debug('List at index ' + i + ' is empty');
  } else {
    System.debug('List at index ' + i + ' has ' + result[i].size() + ' rows');
  }
}
// loop through our contacts list which is at index 2
// need to typecast the list as a contact list, hence (List<Contact>)
for (Contact nextContact : (List<Contact>)result[2]) {
    System.debug(nextContact.Name + ' is with ' + nextContact.Account.Name);   
}

