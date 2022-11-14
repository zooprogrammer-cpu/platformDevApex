trigger CTPersonTrigger on Person__c(
  before insert,
  after insert,
  before update,
  after update,
  after delete,
  after undelete
) {
  switch on Trigger.operationType {
    when BEFORE_INSERT {
      CTPersonTriggerHandler.beforeInsert(Trigger.new);
    }
    when BEFORE_UPDATE {
      CTPersonTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
    }
  }
}