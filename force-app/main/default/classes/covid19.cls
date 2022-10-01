public class covid19 {
  public Integer recoveredInArea = 0;
  public static Integer recoveredInCountry = 0;

  // initialization block 1
  {
    System.debug('Initialization block 1 is called');
  }

  // initialization block 2
  {
    System.debug('Initialization block 2 is called');
  }

  // static initialization block 1
  static {
    System.debug('Static Initialization block 1 is called');
  }

  // static initialization block 2
  static {
    System.debug('Static Initialization block 2 is called');
  }

  //blank constructor
  public covid19() {
    System.debug('Blank constructor is called');
  }

  //parameterized constructor to set class variables value
  public covid19(Integer recoveredInArea) {
    //calling blank constructor
    this();
    System.debug('Parameterized constructor is called');
  }


  public static void printTreated() {
    System.debug('Recovered in country: ' + recoveredInCountry);
  }
}
