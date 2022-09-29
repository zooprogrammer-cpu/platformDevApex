public class HealthCalculator {
    public static Decimal calculateBMI(Decimal weight, Decimal height) {
        Decimal bmi; 
        return bmi = weight / (height * height);
    }

    public static Decimal calculatePace(Decimal distance, Decimal minutes) {
        Decimal hr = minutes/60; 
        Decimal pace; 
        return pace = distance / hr;
    }
}
