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

    public static void insertValidationObject(Boolean wasFound,VinValidationObject vo){
       
        if (wasFound==TRUE) {
            Vin_validation_Result__c result= new Vin_validation_Result__c();
            result.Opportunity__c=vo.oppId;
            result.Name=vo.name;

           
            
            if (vo.bedLength!=null) {
                result.Bed_Length__c=vo.bedLength;
            }

            if (vo.cylinder!=null) {
                result.Cylinder__c=vo.cylinder;
            }
            if (vo.doors!=null) {
                result.Doors__c=vo.doors;
            }
            if (vo.driveType!=null) {
                result.Drive_Type__c=vo.driveType;
            }
            if (vo.engineModel!=null) {
                result.Engine_Model__c=vo.engineModel;
            }
            if (vo.fuelType!=null) {
                result.Fuel_Type__c=vo.fuelType;
            }

            if (vo.make!=null) {
                result.Make__c=vo.make;
            }
            if (vo.manufacter!=null) {
                result.Manufacter_Name__c=vo.manufacter;
            }
            if (vo.model!=null) {
                result.Model__c=vo.model;
            }
            if (vo.modelYear!=null) {
                result.Model_Year__c=vo.modelYear;
            }
            if (vo.seats!=null) {
                result.Number_of_seats__c=vo.seats;
            }

            if (vo.series!=null) {
                result.Series__c=vo.series;
            }
            if (vo.type!=null) {
                result.Vehicle_Type__c=vo.type;
            }
            
            if (vo.windows!=null) {
                result.Windows__c=vo.windows;
            }

            upsert result;
        }

    }
}