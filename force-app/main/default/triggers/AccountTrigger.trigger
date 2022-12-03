trigger AccountTrigger on Account (before insert, before update, before delete, 
after insert, after update, after delete, after undelete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            System.debug('Before Insert');
        }
        else if (Trigger.isUpdate){
            System.debug('Before Update');
        }
        else if (Trigger.isDelete){
            System.debug('Before Delete');
        }
        
    } else if (Trigger.isAfter){
        if (Trigger.isInsert) {
            System.debug('After Insert');
        }
        else if (Trigger.isUpdate) {
            System.debug('After Update');
        }
        else if (Trigger.isDelete) {
            System.debug('After Delete');
        }
        else if (Trigger.isUndelete) {
            System.debug('After Undelete');
        }
    }

}

