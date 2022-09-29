// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

// Intiialize HelloWorld class
HelloWorld firstClass = new HelloWorld();
firstClass.printMessage('Testing from VSCode');

System.debug(firstClass.getDay(0));
System.debug(firstClass.getDay(1));
System.debug(firstClass.getDay(6));
System.debug(firstClass.getDay(10));

