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