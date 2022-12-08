public with sharing class LightningSampleController {
   @AuraEnabled
   public static void createError(){
    try {
        //force an error
        Integer notHappening = 1/0;     
    } catch (Exception e) {
        System.debug('Error caught for re-throwing: ' + e.getMessage()); 
        throw new AuraHandledException(e.getMessage());
    }
   }
}
