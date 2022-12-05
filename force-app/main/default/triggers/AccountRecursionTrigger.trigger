trigger AccountRecursionTrigger on Account (after insert, after update) {
    switch on Trigger.operationType {
        when AFTER_INSERT {
            AccountRecursionTriggerHandler.updateRelatedRatings(Trigger.new, Trigger.oldMap, Trigger.newMap);    
        }
        when AFTER_UPDATE {
            AccountRecursionTriggerHandler.updateRelatedRatings(Trigger.new, Trigger.oldMap, Trigger.newMap);    
        }
    }
}