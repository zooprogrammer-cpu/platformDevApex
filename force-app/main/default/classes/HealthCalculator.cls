public class HealthCalculator {
    public Decimal calculateBMI(Decimal weight, Decimal height) {
        Decimal bmi; 
        return bmi = weight / (height * height);
    }

    public Decimal calculatePace(Decimal distance, Decimal minutes) {
        Decimal hr = minutes/60; 
        Decimal pace; 
        return pace = distance / hr;
    }
}
