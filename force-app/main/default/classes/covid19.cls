public class covid19 {
  public Integer recoveredInArea = 0;
  public static Integer recoveredInCountry = 0;
  
  public covid19(){
    System.debug('Constructor is called');
  }


  public covid19(Integer recoveredInArea){
    this(); 
    this.recoveredInArea = recoveredInArea;
    recoveredInCountry = recoveredInArea;  
  }

  public void treatPatient() {
    recoveredInArea++;
    recoveredInCountry++;
  }


  public static void printTreated() {
    System.debug('Recovered in country: '+ recoveredInCountry);
  }
}
