List <SObject> books = [SELECT Name, Price__c, Author__r.Name FROM Book__c];

for (SObject book : books) {
    System.debug('Book Name: ' + (String)book.get('Name') + 
    'Book Price: ' + (Decimal)book.get('Price__c') + 
    'Book Author: ' + (String)book.getSObject('Author__r').get('Name'));    
}

