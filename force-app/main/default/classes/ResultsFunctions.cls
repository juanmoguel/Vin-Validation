public with sharing  class ResultsFunctions {
    
    public static Boolean validateCodeError(String errorCode ){
        if((errorCode=='6 - Incomplete VIN')||(errorCode=='0 - VIN decoded clean. Check Digit (9th position) is correct')){
            System.debug('Entro a true');
            return true;
        }
        
        else{
            return false;
        }
    }
    
    public static void updateOppStatus(String recordId,Boolean wasFound){
         Opportunity opp = new Opportunity(Id=recordId);
        System.debug('el id es:'+recordId);
        if(wasFound==TRUE){
            System.debug('entro was found true');
			opp.Vin_validation_Status__c='Verified';            
        }
        else{
            System.debug('entro was found false');
            opp.Vin_validation_Status__c='Not Found';
        }
        
        update opp;

    }
}