public with sharing class CarExample {
    public String model;
    public Integer speed;

    public void displayCarInfo(String model, Integer speed) {
        System.debug('The model of the car is: ' + model);
        System.debug('The Speed is: ' + speed);
    }
}