trigger AccountTrigger on Account(before insert, before update) {
  switch on Trigger.operationType {
    when BEFORE_INSERT {
      System.debug('Switch - Before Insert');
      showNewRecords();
    }
    when BEFORE_UPDATE {
      System.debug('Switch - Before Update');
      showNewRecords();
      showOldRecords();
      //check for change
      for (Id nextId : Trigger.newMap.keySet()) {
        didNameChange(nextId);
      }
    }
  }

  //print all new records list that are just going to be inserted
  void showNewRecords() {
    System.debug('BEGIN NEW RECORD LIST');
    for (Account nextNew : Trigger.new) {
      System.debug(nextNew);
    }
  }
  // pull keys from old records
  void showOldRecords() {
    System.debug('BEGIN OLD RECORD MAP');
    for (Id nextOldId : Trigger.oldMap.keySet()) {
      System.debug('Key: ' + nextOldId);
      System.debug('value: ' + Trigger.oldMap.get(nextOldId));
    }
  }

  // method to compare two records to each other.
  // Common use case for oldMap and newMap to compare if something about a record changed.
  // pass the recordId and check if the name changed between the old and the new

  Boolean didNameChange(Id recordId) {
    Account oldRecord = Trigger.oldMap.get(recordId);
    Account newRecord = Trigger.newMap.get(recordId);
    Boolean changed = false;

    if (oldRecord != null && newRecord != null) {
      changed = !oldRecord.Name.equalsIgnoreCase(newRecord.Name);
      System.debug('Record Changed: ' + changed);
    }
    return changed;
  }
}
