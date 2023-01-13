@isTest
public with sharing class DataGeneration_Tests {
    @isTest
    static void Brute_Force() {
        List<Account> accList = new List<Account>();
        Account acc = new Account(Name = 'Ash LLC');
        insert acc; 
        Test.startTest();
            accList = [SELECT Id FROM Account];
        Test.stopTest(); 
        System.assertEquals(1, accList.size(), 'There are no accounts');
    }
}