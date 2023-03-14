public with sharing class CTPersonTriggerHandler {
  //Before insert function for Person__c Object
  public static void beforeInsert(List<Person__c> newRecords) {
    for (Person__c person : newRecords) {
      //Update health status to green
      person.Health_Status__c = 'Green';
      //Generate unique token for the person record
      person.Token__c = CTPersonController.getToken(person.Mobile__c);
    }
  }
  //Before update operation for Person__c object
  //need to use oldMap to check if the status field really updated or not
  public static void beforeUpdate(
    List<Person__c> newRecords,
    Map<Id, Person__c> oldRecordsMap
  ) {
    for (Person__c person : newRecords) {
      // check if the status changed in thie transaction
      // if the new value is not equal to old value, then we will update the status date
      if (
        person.Health_Status__c != oldRecordsMap.get(person.id).Health_Status__c
      ) {
        person.Status_Update_Date__c = Date.today();
      }
    }
  }

  //After update operation for Person__c object
  //need to use oldMap to check if the status field really updated or not
  public static void afterUpdate(List<Person__c> newRecords,Map<Id, Person__c> oldRecordsMap) {
    Set<Id> statusChange = new Set<Id>();
    Set<Id> redStatus = new Set<Id>();
    Set<Id> orangeStatus = new Set<Id>();
    Set<Id> yellowStatus = new Set<Id>();
    List<Person__c> personToUpdate = new List<Person__c>();
    for (Person__c person : newRecords) {
      // check if the status changed in the transaction
      // if the new value is not equal to old value, then we will update the status date
      if (person.Health_Status__c != oldRecordsMap.get(person.id).Health_Status__c) {
        statusChange.add(person.Id);
      }
      if (person.Health_Status__c == 'Red' && oldRecordsMap.get(person.id).Health_Status__c != 'Red'){
        redStatus.add(person.Id);

      }
    }
    Set<Id> alreadyProcessed = new Set<Id>();
    alreadyProcessed.addAll(redStatus); 
    // If a person's Health Status updates to Red, mark all "Cohabitants" and "Primary Contacts" Orange.
    orangeStatus.addAll(CTPersonController.getCohabitants(redStatus, alreadyProcessed));
    Set<Id> primaryContacts = new Set<Id>();
    orangeStatus.addAll(primaryContacts);
    primaryContacts.addAll(CTPersonController.getPrimaryContact(redStatus, alreadyProcessed));
    
    // If a person's Health Status updates to Red, mark all "Neigbors" and "Secondary Contacts" Yellow.
    yellowStatus.addAll(CTPersonController.getNeighbours(redStatus, alreadyProcessed));
    // In this case, we need to pass the output of the getPrimaryContact
    yellowStatus.addAll(CTPersonController.getSecondaryContacts(primaryContacts, alreadyProcessed));
    // Update the Health Status of the Person
    for (Id pid : orangeStatus) {
      personToUpdate.add(new Person__c(Id =pid, Health_Status__c = 'Orange'));
    }
    for (Id pid : yellowStatus) {
      personToUpdate.add(new Person__c(Id =pid, Health_Status__c = 'Yellow'));
    }
    if (personToUpdate.size() > 0){
      update personToUpdate; 
    }

  }
}