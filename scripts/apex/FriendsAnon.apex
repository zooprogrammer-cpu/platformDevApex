//instantiate the class

Friends pizzaNight = new Friends(); 

//Calculate Ross's amount
Integer rossHasToPay = pizzaNight.getBill(3);  
System.debug('Ross has to Pay: ' + rossHasToPay);

//Calculate Chandler's amount
Integer chandlerHasToPay = pizzaNight.getBill(1);
System.debug('Chandler has to Pay: ' + chandlerHasToPay);