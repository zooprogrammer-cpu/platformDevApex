List <SObject> books = [SELECT Name, Price__c FROM Book__c];

for (SObject book : books) {
    System.debug('Book Name: ' + (String)book.get('Name') + 'Book Price: ' + (Decimal)book.get('Price__c'));    
}
