public with sharing class CTPersonController {
  public static String getToken(String mobileNo) {
    // generate unique hash using md5 algorithm
    Blob value = Blob.valueOf(mobileNo);
    Blob hash = Crypto.generateDigest('MD5', value);

    //get the string value of has blob
    return EncodingUtil.base64Encode(hash);
  }

  // get 100 contacts with recent health status change
  public static List<Person__c> getRecentHealthChanges() {
    return [
      SELECT
        Id,
        Name,
        Health_Status__c,
        Mobile__c,
        Status_Update_Date__c,
        Token__c
      FROM Person__c
      ORDER BY Status_Update_Date__c DESC NULLS LAST
      LIMIT 100
    ];
  }

  // search contacts matching Name, Mobile or Token
  public static List<Person__c> searchPeople(String searchTerm) {
    searchTerm = searchTerm + '%';
    return [
      SELECT
        Id,
        Name,
        Health_Status__c,
        Mobile__c,
        Status_Update_Date__c,
        Token__c
      FROM Person__c
      WHERE
        Name LIKE :searchTerm
        OR Token__c LIKE :searchTerm
        OR Mobile__c LIKE :searchTerm
      ORDER BY Status_Update_Date__c DESC NULLS LAST
    ];
  }

  // query a person record where Id matches the personId parameter
  public static Person__c getPersonById(String personId) {
    List<Person__c> people = [
      SELECT
        Id,
        Name,
        Health_Status__c,
        Mobile__c,
        Status_Update_Date__c,
        Token__c
      FROM Person__c
      WHERE Id = :personId
    ];

    if (people != null && people.size() > 0) {
      return people[0];
    }
    //if no people found on the list, return null
    return null;
  }

  public static Map<String, Integer> getHealthStatusCount() {
    //using total to alias COUNT(Id)
    Map<String, Integer> healthCountMap = new Map<String, Integer>();
    for (AggregateResult ar : [
      SELECT Health_Status__c, COUNT(Id) total
      FROM Person__c
      GROUP BY Health_Status__c
    ]) {
      //need to type cast the Health Status and total before adding to the map
      String healthStatus = String.valueOf(ar.get('Health_Status__c'));
      Integer count = Integer.valueOf(ar.get('total'));
      healthCountMap.put(healthStatus, count);
    }
    return healthCountMap;
  }
  //CT Person Challenge 10
  //Method to return a list of Cohabitants for all the people who are in the personIds set
  // and whose health status is Green or Yellow
  public static Set<Id> getCohabitants(Set<Id> personIds, Set<Id> alreadyProcessed) {
    // Build list of health status to add which are Green and Yellow
    List<String> healthStatuses = new List<String>{ 'Green', 'Yellow' };
    List<People_Tracing__c> peopleTraces = [
      SELECT Id
      FROM People_Tracing__c
      WHERE
        (Person_1__c IN :personIds
        OR Person_2__c IN :personIds)
        AND Contact_Type__c = 'Cohabitants'
        AND (Person_1__r.Health_Status__c IN :healthStatuses
        OR Person_2__r.Health_Status__c IN :healthStatuses)
    ];
    // Make a unique set of cohabitants so that there are no duplicate cohabitants
    // since a person can be stored as Person_1__c or Person_2__c
    Set<Id> cohabitants = new Set<Id>();
    for (People_Tracing__c pt : peopleTraces) {
      if (!alreadyProcessed.contains(pt.Person_1__c)) {
        cohabitants.add(pt.Person_1__c);
        alreadyProcessed.add(pt.Person_1__c);
      }
      if (!alreadyProcessed.contains(pt.Person_2__c)) {
        cohabitants.add(pt.Person_2__c);
        alreadyProcessed.add(pt.Person_2__c);

      }
    }
    return cohabitants;
  }

  //Method to return a list of Neighbours for all the people who are in the personIds set
  public static Set<Id> getNeighbours(Set<Id> personIds, Set<Id> alreadyProcessed) {
    // Build list of health status to add which are Green
    List<People_Tracing__c> peopleTraces = [
      SELECT Id
      FROM People_Tracing__c
      WHERE
        (Person_1__c IN :personIds
        OR Person_2__c IN :personIds)
        AND Contact_Type__c = 'Neighbours'
        AND (Person_1__r.Health_Status__c = 'Green'
        OR Person_2__r.Health_Status__c = 'Green')
    ];
    // Make a unique set of neighbors so that there are no duplicate neighbors
    // since a person can be stored as Person_1__c or Person_2__c
    Set<Id> neighbours = new Set<Id>();
    for (People_Tracing__c pt : peopleTraces) {
      if (!alreadyProcessed.contains(pt.Person_1__c)) {
        neighbours.add(pt.Person_1__c);
        alreadyProcessed.add(pt.Person_1__c);
      }
      if (!alreadyProcessed.contains(pt.Person_2__c)) {
        neighbours.add(pt.Person_2__c);
        alreadyProcessed.add(pt.Person_2__c);

      }
    }
    return neighbours;
  }

  //Method to return a list of primary contacts for all the people who are in the personIds set
  public static Set<Id> getPrimaryContact(Set<Id> personIds, Set<Id> alreadyProcessed) {
    // Build list of health status to add which are Green and Yellow
    List<String> healthStatuses = new List<String>{ 'Green', 'Yellow' };

    List<People_Tracing__c> peopleTraces = [
      SELECT Id
      FROM People_Tracing__c
      WHERE
        (Person_1__c IN :personIds
        OR Person_2__c IN :personIds)
        AND Contact_Type__c = 'Other'
        AND Contact_Date__c = LAST_N_DAYS:10
        AND (Person_1__r.Health_Status__c IN :healthStatuses
        OR Person_2__r.Health_Status__c IN :healthStatuses)
    ];
    // Make a unique set of primaryContacts so that there are no duplicate primaryContacts
    // since a person can be stored as Person_1__c or Person_2__c
    Set<Id> primaryContacts = new Set<Id>();
    for (People_Tracing__c pt : peopleTraces) {
      if (!alreadyProcessed.contains(pt.Person_1__c)) {
        alreadyProcessed.add(pt.Person_1__c);
        primaryContacts.add(pt.Person_1__c);
      }
      if (!alreadyProcessed.contains(pt.Person_2__c)) {
        alreadyProcessed.add(pt.Person_2__c);
        primaryContacts.add(pt.Person_2__c);
      }
    }
    return primaryContacts;
  }

  //Method to return a list of secondary contacts for all the people who are in the personIds set
  public static Set<Id> getSecondaryContacts(Set<Id> primaryContactsIds, Set<Id> alreadyProcessed) {
    // Build list of health status to add which are Green and Yellow
    List<String> healthStatuses = new List<String>{ 'Green', 'Yellow' };

    List<People_Tracing__c> peopleTraces = [
      SELECT Id
      FROM People_Tracing__c
      WHERE
        (Person_1__c IN :primaryContactsIds
        OR Person_2__c IN :primaryContactsIds)
        AND Contact_Type__c = 'Other'
        AND Contact_Date__c = LAST_N_DAYS:10
        AND (Person_1__r.Health_Status__c IN :healthStatuses
        OR Person_2__r.Health_Status__c IN :healthStatuses)
    ];
    // Make a unique set of secondaryContacts so that there are no duplicate secondaryContacts
    // since a person can be stored as Person_1__c or Person_2__c
    Set<Id> secondaryContacts = new Set<Id>();
    for (People_Tracing__c pt : peopleTraces) {
      if (!alreadyProcessed.contains(pt.Person_1__c)) {
        alreadyProcessed.add(pt.Person_1__c);
        secondaryContacts.add(pt.Person_1__c);
      }
      if (!alreadyProcessed.contains(pt.Person_2__c)) {
        alreadyProcessed.add(pt.Person_2__c);
        secondaryContacts.add(pt.Person_2__c);
      }
    }
    return secondaryContacts;
  }
}
