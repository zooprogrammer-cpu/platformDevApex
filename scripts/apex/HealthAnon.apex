//HealthCalculator ashHealth = new HealthCalculator();
Decimal ashBMI = HealthCalculator.calculateBMI(160, 6);
System.debug('Ash BMI is: ' + ashBMI);
Decimal ashPace = HealthCalculator.calculatePace(200, 80);
System.debug('Ash Pace is: ' + ashPace);