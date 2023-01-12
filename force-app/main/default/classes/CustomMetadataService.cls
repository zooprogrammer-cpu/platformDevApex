/**
 * Created by aayushbasnyat on 1/8/23.
 */

public with sharing class CustomMetadataService {
    public static void fetchAllMetadata(){
        Map<String, Support_Tier__mdt>  allSupportTiers= Support_Tier__mdt.getAll();
        System.debug('allSupportTiers: ' + allSupportTiers);
        System.debug('All support tiers size: ' + allSupportTiers.size());

        for (String supportTierName : allSupportTiers.keySet()) {
            System.debug('Support Tier Names: ' + supportTierName +
                    'Discount: ' + allSupportTiers.get(supportTierName).Default_Discount__c );
        }
    }

    // find the discount of one specific support tier:

    public static void fetchDiscount(String supportTier) {
        Support_Tier__mdt singleTier = Support_Tier__mdt.getInstance(supportTier);
        System.debug('Support Tier Name: ' + supportTier + 'Discount: ' + singleTier?.Default_Discount__c);
        coolMethod(singleTier);
    }

    public static void coolMethod(Support_Tier__mdt val) {
        System.debug('Cool Support Tier: ' + val); 
        System.debug('Cool Support Tier Discount: ' + val.Default_Discount__c);   
    }
    
}