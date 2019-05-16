@isTest
public with sharing class TestResultsFunctions {
   @isTest static void TestCorrectCode() {
       String errorCode='6 - Incomplete VIN';

        Boolean results=ResultsFunctions.validateCodeError(errorCode);

        System.assertEquals(True, results);
    }

    @isTest static void TestWrongCode() {
       String errorCode='this is wrong code';

        Boolean results=ResultsFunctions.validateCodeError(errorCode);

        System.assertEquals(False, results);
    }

    @isTest static void TestInsertObject(){
        Decimal bedLenght=null;
        Integer doors=4;
        Integer seats=null;
        Integer windows=null;
        Integer cylinder=6;
        String driveType;
        String engineModel;
        String fuelType='Gasoline';
        String makeObj='BMW';
        String manufacter='BMW MANUFACTURER CORPORATION BMW NORTH AMERICA';
        String modelObj='X3';
        String modelYear='2011';
      
        String series='X3';
        String type='MULTIPURPOSE PASSENGER VEHICLE (MPV)';
        String name='Validation of 5UXWX7C5*BA';

        String oppId=TestDataFactory.createOpp();
        

        VinValidationObject obj= new VinValidationObject(bedLenght,cylinder,doors,driveType,engineModel,fuelType,makeObj,manufacter,modelObj,modelYear,seats,oppId,series,type,name,windows);
        ResultsFunctions.insertValidationObject(true, obj);

        Vin_validation_Result__c expected= [SELECT Id,Name from Vin_validation_Result__c where Name=:name];

        System.assertEquals(expected.Name, obj.Name);

            


        
    }
}
