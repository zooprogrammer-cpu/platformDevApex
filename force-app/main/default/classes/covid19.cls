public class covid19 {
  public Integer recoveredInArea = 0;
  public static Integer recoveredInCountry = 0;

  {
    recoveredInArea = 10;
    recoveredInCountry = 15;
  }

  public void treatPatient() {
    recoveredInArea++;
    recoveredInCountry++;
  }

  public static void printTreated() {
    System.debug('Recovered in country: ' + recoveredInCountry);
  }
}
