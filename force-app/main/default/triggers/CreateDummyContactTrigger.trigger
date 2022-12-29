trigger CreateDummyContactTrigger on Account (after insert) {
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