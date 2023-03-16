public with sharing class CTLocationTriggerHandler {
  public static void beforeInsert(List<Location__c> newLocations) {
    for (Location__c loc : newLocations) {
      loc.Status__c = 'Green';
    }
  }

  public static void beforeUpdate(List<Location__c> newLocations, Map<Id, Location__c> oldLocationsMap ) {
    for (Location__c loc : newLocations) {
        if (loc.Status__c !=oldLocationsMap.get(loc.Id).Status__c){
            loc.Status_Update_Date__c = Date.today();
        }
    }
  }
}
