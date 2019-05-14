public with sharing class ObjectManagement {
    public static list<validationObject> createResultObject(List<Object> results) {
        List<validationObject> listOfObjects = new List<validationObject>();
        for(Object rs:results){
                Map<String, Object> details = (Map<String, Object>)rs;
                String key= (String) details.get('Variable');
                validationObject vobject= new validationObject(key,(String) details.get('Value'));
                listOfObjects.add(vobject);
        }
        return listOfObjects;
    }
/*
    public static void insertVinValidation(List<validationObject> objecttoInsert,String vinNumber){
       
      String newObjectName='Validation of'+vinNumber;
      System.debug('vin number '+vinNumber);
      Vin_validation_Result__c vinObject = new Vin_validation_Result__c(Name=newObjectName);
      System.debug('Nuevo objecto arriba:'+ vinObject.Name);

        for(validationObject vo:objecttoInsert){
         
            switch on vo.attribute {
                when 'Bed Length (inches)'{
                   Integer intCheck = Integer.ValueOf(vo.aValue); 
                   Decimal decVal = Decimal.ValueOf(intCheck);
                    vinObject.Bed_Length__c=decVal;
                }
                when 'Engine Number of Cylinders' {
                    vinObject.Cylinder__c=Integer.valueof(vo.aValue);
                }
                when 'Doors' {
                    vinObject.Doors__c=Integer.valueof(vo.aValue);
                }
                when 'Drive Type' {
                    vinObject.Drive_Type__c=vo.aValue;
                }
                when 'Engine Model' {
                    vinObject.Engine_Model__c=vo.aValue;
                }
                when 'Fuel Type - Primary' {
                    vinObject.Fuel_Type__c=vo.aValue;
                }
                when 'Make' {
                    vinObject.Make__c=vo.aValue;
                }
                when 'Manufacturer Name' {
                    vinObject.Manufacter_Name__c=vo.aValue;
                }
                when 'Model' {
                    vinObject.Model__c=vo.aValue;
                }
                when 'Model Year' {
                    vinObject.Model_Year__c=vo.aValue;
                }
                when 'Number of Seats' {
                    vinObject.Number_of_seats__c=Integer.valueof(vo.aValue);
                }
                when 'Series' {
                    vinObject.Series__c=vo.aValue;
                }
                when 'Vehicle Type' {
                    vinObject.Vehicle_Type__c=vo.aValue;
                }
                when 'Windows' {
                    vinObject.Windows__c=Integer.valueof(vo.aValue);
                }
                
            }
           
        }

   
   System.debug('hey');
  Opportunity opp=[SELECT ID,Vin_validation_Status__c FROM Opportunity where VIN_Number__c=:vinNumber];
    System.debug('Select es:'+opp.Id);
    vinObject.Opportunity__c=opp.Id;
    opp.Vin_validation_Status__c='Verified';

    upsert vinObject;
    update opp;
    }*/
    
    public static void doFunctions(List<validationObject> objectToInsert,String vinNumber,String oppId){
        String errorCode;
        for(validationObject vo:objecttoInsert){
            if(vo.attribute=='Error Code'){
                errorCode=vo.aValue;
            } 
            
        }
        
      Boolean vinFound=ResultsFunctions.validateCodeError(errorCode);
      
      ResultsFunctions.updateOppStatus(oppId,vinFound);
        
    }

    public class validationObject{
        public validationObject(String variable,String value){
            attribute=variable;
            aValue=value;
        }

        @AuraEnabled
        public String attribute { get; private set; }
        @AuraEnabled
        public String aValue { get; private set; }
    }
}