trigger AccountTrigger on Accountv (before insert, before update, before delete, 
after insert, after update, after delete, after undelete) {
    if (Trigger.isBefore) {
        
    }
}