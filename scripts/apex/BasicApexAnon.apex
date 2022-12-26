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


