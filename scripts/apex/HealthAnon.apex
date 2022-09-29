HealthCalculator ashHealth = new HealthCalculator();
Decimal ashBMI = ashHealth.calculateBMI(160, 6);
System.debug('Ash BMI is: ' + ashBMI);
Decimal ashPace = ashHealth.calculatePace(200, 80);
System.debug('Ash Pace is: ' + ashPace);