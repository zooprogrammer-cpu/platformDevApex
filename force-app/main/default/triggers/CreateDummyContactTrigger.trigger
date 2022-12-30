trigger CreateDummyContactTrigger on Account (after insert, before delete) {
    if (Trigger.isAfter && Trigger.isInsert) {
        List<Contact> contactList = new List<Contact>();
        for (Account acc : Trigger.new) {
            Contact con = new Contact();
            con.AccountId = acc.Id; 
            con.FirstName = 'Dummy'; 
            con.LastName = acc.Name; 
            contactList.add(con);
        }
        insert contactList;     
    }

    else if (Trigger.isBefore){
        if (Trigger.isDelete) {
            List <Account> accList = new List<Account>();
            Set<Id> acctIdSet = new Set<Id>();  
            //Bulkify trigger - when multiple accounts are being deleted at same time, 
            //Trigger.old gives all accounts that are being deleted 
            //Add all those account Ids to accIdSet
            for (Account acc : Trigger.old) {
                acctIdSet.add(acc.Id);     
            } 
            // get all account and contacts using parent to child inner query where Account Id is avaailable in the set
            // put them in a map variable
            Map<Id, Account> accts = new Map<Id, Account>([SELECT Id, Name, (SELECT Id FROM Contacts ) 
                                                        FROM Account WHERE Id IN: acctIdSet]);
                                                        
        }

    }
  

}