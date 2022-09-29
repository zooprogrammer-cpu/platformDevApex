public class covid19 {
  public Integer recoveredInArea = 0;
  // static makes the varaible does not belong to madison or dubuque class instance. 
  // it belongs to the class itself. 
  public static Integer recoveredInCountry = 0;
   
  // if we add public static void to this method, we get error 
  // since the treatPatient belongs to the class but 
  // recoveredInArea is not static and will have a value of null until it gets instantiated
  public void treatPatient() {
    recoveredInArea++;
    recoveredInCountry++;
  }

  public static void printTreated() {
    System.debug('Recovered in country: '+ recoveredInCountry);
  }
}
