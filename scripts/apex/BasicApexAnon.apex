System.debug('revenue:' +MethodsAndModifiers.updateRevenue(500, 250));

MethodsAndModifiers mam = new MethodsAndModifiers();
mam.CalculateRevenueAndFees(); 

for (Integer i = 0; i < 10; i++) {
    if (i == 5) {
        break;    
    }
        System.debug(i);

}

CarExample carObj1 = new CarExample();
carObj1.model = 'BMW';
carObj1.speed = 89;
carObj1.displayCarInfo();

CarExample carObj2 = new CarExample();
carObj2.model = 'Audi';
carObj2.speed = 78;
carObj2.displayCarInfo();


Calculator calc1 = new Calculator();

System.debug('The sum is: ' + calc1.addition(3,5));

System.debug('The multiplied value is: ' + calc1.multiplication(2,7));

System.debug('The addition of three numbers are: ' + calc1.addition(3, 4, 5));

// invoking the user defined constructor with arguements
Student student1 = new Student('Jacob', 'St. Xavier\'s');
student1.displayInfo();

Student student2 = new Student ('Ash', 'St. Xavier\'s');
student2.displayInfo();

// invoking the no arguement constructor
Student student3 = new Student();
student3.displayInfo();

EmployeeExample emp1 = new EmployeeExample('Ash', 20, 200000);
emp1.display(); 

EmployeeExample emp2 = new EmployeeExample(); 
emp2.display();

EmployeeExample emp3 = new EmployeeExample('Dug', 4);
emp3.display(); 


StaticAndNonStaticMethodExample method1 = new StaticAndNonStaticMethodExample();
method1.nonStaticMethod();

StaticAndNonStaticMethodExample.staticMethod();

StaticAndNonStaticVariableExample obj1 = new StaticAndNonStaticVariableExample();
obj1.num1 = 5;
//obj1.num2 =8; // static field cannot be referenced from a non static context
StaticAndNonStaticVariableExample.num2 = 8; //static variable can bce called from the class directly
obj1.increment();
obj1.display();

Teacher teach1 = new Teacher();
teach1.name = 'Joseph';
teach1.age = 70;
Teacher.schoolName = 'Ideal Model School';


Teacher teach2 = new Teacher();
teach2.name = 'Francis';
teach2.age = 50;
Teacher.schoolName = 'Little Angeles SChool';

teach1.display();
teach2.display();

List<SObject> Objects = new List<SObject>();
Account acc = new Account(Name= 'Ash Consulting');
Contact con = new Contact(FirstName = 'Dug', LastName = 'Basnyat');
Objects.add(acc);
Objects.add(con);
System.debug('The list of Records are: ' + Objects);

List<List<SObject>> searchList = [FIND'Basnyat' IN ALL FIELDS
                                      RETURNING Account(Name), Contact(FirstName,LastName)];
System.debug(searchList); 

Account acc1 = new Account(Name = 'Madison Public Library');
insert acc1; 


List<Account> accs = [SELECT Id FROM Account WHERE Name LIKE 'United%'];
List<Account> accountsToUpdate = new List<Account>();
for (Account acc : accs) {
    acc.Industry = 'Finance'; 
    accountsToUpdate.add(acc);   
}
update accountsToUpdate; 


AccountUtility accUti = new AccountUtility();
accUti.createSingleAccount('New Hamption Inc', 'Malibu');

AccountUtility accUti2 = new AccountUtility(); 
accUti2.createMultipleAccounts(5, 'Real Estate Account ');

AccountUtility accUti3 = new AccountUtility();
accUti3.updateAccount('Ash Consulting');

AccountUtility accUti4 = new AccountUtility();
accUti4.deleteAccounts('Real Estate');

Account acc1 = new Account(Name= 'Lucky Dog LLC', BillingCity = 'Madison');
Account acc2 = new Account(BillingCity = 'Madison');
List<Account> listAccounts = new List<Account>();
listAccounts.add(acc1);
listAccounts.add(acc2);
Database.SaveResult[] srList = Database.insert(listAccounts, false);

for (Database.SaveResult sr : srList) {
    if (sr.isSuccess()) {
        //operation was successful, so get the success results ID
        System.debug('Succefully inserted account: ' + sr.getId());    
    }
    else {
        //operation failed. so get all errors
        for (Database.Error err : sr.getErrors()) {
            System.debug('The following errors have occurred');
            System.debug(err.getStatusCode() + ':' + err.getMessage());
            System.debug('Account fields that affected this error: ' + err.getFields());
        }
    }
    
}


Database.executeBatch(new AccountUpdateNullValuesBatch(),10);

Database.executeBatch(new StatefulBatchApex(),10);

try{
Lead lead1 = new Lead(LeadSource = 'Phone', FirstName = 'John', LastName = 'Hamm');
System.debug('Trying to insert a lead');
insert lead1; 
}
catch(DmlException e){
System.debug('Error occurred'+ e.getMessage());
}

Integer firstElem;
Integer fourthElem;
try{
    List<Integer> li = new List<Integer>();
    li.add(15);
    li.add(6);
    firstElem = li[0];
	fourthElem = li[3];
}
catch(ListException e){
    System.debug('List exception occurred: ' + e);
}

System.debug('Element at index 0: ' + firstElem);


String s; // the value of s is null here
Boolean v;

try{
   v = s.contains('ABC');
   System.debug('Does the string contain ABC? ' + v);

}
catch(NullPointerException e){
    System.debug('Exception occurred: ' + e.getMessage());
}


Account v; 
try{
Account acc = new Account(Name = 'ABC Corp');
insert acc; 
v = [SELECT Id, Name FROM Account WHERE Id=: acc.Id];
String s = v.Description; //results in sObject exception
}

catch(SObjectException e){
    System.debug('exception type caught: ' + e.getTypeName());
    System.debug('Message: ' + e.getMessage());
    System.debug('Cause: ' + e.getCause());
    System.debug('Line Number: ' + e.getLineNumber());
    System.debug('Stack Trace: ' + e.getStackTraceString());
}


Account acc1 = new Account(Name = 'ABC Corp' , Description = 'THe biggest company');
Account acc2 = new Account();
Account acc3 = new Account();

List<Account> accList = new List<Account>();
accList.add(acc1);
accList.add(acc2);
accList.add(acc3);

try{
insert accList; 

}
catch(DmlException e){
    Integer numOfErrors = e.getNumDml();
    System.debug('getNuDml: ' + numOfErrors);
    for (Integer i = 0; i < numOfErrors; i++) {
        System.debug('getDmlfieldNames: ' + e.getDmlFieldNames(i));
        System.debug('getDmlMessage: ' + e.getDmlMessage(i));
        
    }
}

AcctUtility.mainProcessing(); 

Map<Id, String> accountMap = new Map<Id,String>();

for (Contact con : [SELECT Id, AccountId,Account.Name FROM Contact WHERE AccountId != NULL LIMIT 20]) {
    accountMap.put(con.AccountId,con.Account.Name);
}
System.debug(accountMap);

for (Id i : accountMap.keySet()) {
    System.debug('Account ID: ' + i);
}

// Database Schema Class
// getGlobalDescribe Method - Returns a List of all objects in the org. Also get the fields of the objects
// 
List<schema.SObjectType> gd = Schema.getGlobalDescribe().values();
for (schema.SObjectType g : gd) {
    System.debug('Object Name' + g.getDescribe().getName() + 'Fields=>' + g.getDescribe().fields.getMap().values());
}

// get fields of just Account Object

Schema.DescribeSObjectResult accDesc = Account.sObjectType.getDescribe(); 
Map<String, Schema.SObjectField> accFields = accDesc.fields.getMap(); 
for (Schema.SObjectField fld : accFields.values()) {
    System.debug('Fields: ' + fld);
}

// get childRelationships of an Object
Schema.DescribeSObjectResult describeResult= Account.SObjectType.getDescribe();
List<Schema.ChildRelationship> listofChildRel = describeResult.getChildRelationships();
for(Schema.ChildRelationship childRel : listofChildRel ){
    if (childRel.getRelationshipName() != null){
        System.debug(childRel.getRelationshipName());
    }
}

// get tabs associated with an app
List<Schema.DescribeTabSetResult> tabSetDesc = Schema.describeTabs();
for(Schema.DescribeTabSetResult tsr:tabSetDesc){
    String appLabel = tsr.getLabel();
    if(appLabel == 'Sales'){
        List<Schema.DescribeTabResult> tabDescri = tsr.getTabs();
        for (Schema.DescribeTabResult tab : tabDescri){
            System.debug('Label: ' + tab.getLabel() );
        } 
    } 
}

//find all required fields of sObject
Map<String, Schema.SObjectType> m= Schema.getGlobalDescribe();
Schema.SObjectType s = m.get('Opportunity');
Schema.DescribeSObjectResult descOpportunity = s.getDescribe();
System.debug('Describe for Opportunity: ' + descOpportunity); 
Map<String, Schema.SObjectField> fields = descOpportunity.fields.getMap(); 
System.debug('Fields of the Opportunity: ' + fields );

List<String> listRequiredFields = new List<String>(); 
for (String f:fields.KeySet()){
    Schema.DescribeFieldResult describeField = fields.get(f).getDescribe();
    if (describeField.isCreateable() && !describeField.isNillable() && !describeField.isDefaultedOnCreate()){
        listRequiredFields.add(f);    
    }
}

System.debug('Required Fields for the Object: ' + listRequiredFields); 

System.debug(TemperatureConverter.convertFahrenheitToCelsius(70));


CustomMetadataService.fetchDiscount('Gold');

Map<String, String> colorCodes = new Map<String, String>();
colorCodes.put('Red', 'F798798');
colorCodes.put('Yellow', 'THUHUH');
colorCodes.put('Green', 'YIUIU');

Set<String> colorSet = new Set<String>();
colorSet = colorCodes.keySet();
System.debug(colorSet);
