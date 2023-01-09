/**
 * Created by aayushbasnyat on 1/8/23.
 */

// public with sharing class CustomMetadataService {
//     Id recordId; 

//     // create a constructor class
//     public CustomMetadataService(Id id){
//         recordId = id;     
//     }

//     public void displayInfo() {
//         System.debug('This is the recordId:' + recordId);
//     }
// }

public with sharing class CustomMetadataService {
    public static void test(Id recordId) {
        System.debug('This is the recordId: ' + recordId);     
    }

}

// test