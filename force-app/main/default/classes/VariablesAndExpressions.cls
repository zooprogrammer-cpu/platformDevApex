public class VariablesAndExpressions {
  public static void variables() {
    String accountName;
    System.debug(accountName); //prints null
    accountName = 'Test Account';
    System.debug(accountName);
    //accountName = 234324; //Illegal assignment from Integer to String

    final Integer ACCOUNT_NUMBER = 200; //denote constants that do not change
    System.debug(ACCOUNT_NUMBER);
    ACCOUNT_NUMBER = 500; // final varaible has already been initialized
  }

  public static void expressions() {
    Decimal grossIncome = 5300;
    Decimal costs = 700.50;

    Decimal revenue = grossIncome - costs;
    System.debug('The final revenue is :' + revenue);
  }

  public static void conversion() {
    // implicit type conversion. 
    // Only works if converting from a lower
    // data type to higher. Integer to decimal is allowed but not the other way around
    Integer intOfOpps = 12; 
    System.debug(intOfOpps);  

    Long longOfOpps = intOfOpps; 
    System.debug(longOfOpps);

    Double doubleOfOpps = longOfOpps; 
    System.debug(doubleOfOpps);

    Decimal decimalOfOpps = doubleOfOpps; 
    System.debug(decimalOfOpps);

    //explicit type conversion - converting to string
    String stringOfOpps = String.valueOf(intOfOpps);
    System.debug(stringOfOpps);

    // implicit casting when using string values for contactId
    String contactIdString = '0035Y00003pQtQq'; // this is 15 characters
    System.debug('Number of characters in contactIdString: ' + contactIdString.length());
    Id contactId = contactIdString; 
    System.debug('contactId: ' + contactId); // this prints it in 18 characters
  }
}
