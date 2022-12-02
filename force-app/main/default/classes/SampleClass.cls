public with sharing class SampleClass {
    public static Integer instanceCount = 0; 
    Integer myInt; 
    String myString; 
    Boolean myBool;

    // this is the constructor that accepts three arguements
    public SampleClass(Integer j, String str, Boolean bool){
        System.debug('3-arguement constructor finished');
        // the passed varaibles in this constructor class will be assigned 
        // to the private variables. take my copy of myBool and sets it to bool
        // notice instanceCount does  not have a this since static variable 
        // is shared across all instanced
        this.myBool = bool;
        this.myString = str;
        this.myInt = j;
        instanceCount ++;
    }

    // constructor clss with two values
    public SampleClass(Integer j, String str){
        this(j,str,null); //must be first line of constructor
        System.debug('2-arguement constructor finished');
    }

    //constructor class with no values
    public SampleClass(){
        System.debug('No arguement constructor finished');
    }
}
