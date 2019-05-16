@isTest
public class TestObjectManagement {
   
    
    

    static String testJsonResponse ='{"Count":131,"Message":"Results returned successfully","SearchCriteria":"VIN:5UXWX7C5*BA","Results":[{"Value":"","ValueId":"","Variable":"Suggested VIN","VariableId":142},{"Value":"6 - Incomplete VIN","ValueId":"6","Variable":"Error Code","VariableId":143},{"Value":"","ValueId":"","Variable":"Possible Values","VariableId":144},{"Value":null,"ValueId":"","Variable":"Additional Error Text","VariableId":156},{"Value":null,"ValueId":null,"Variable":"Destination Market","VariableId":10},{"Value":"BMW","ValueId":"452","Variable":"Make","VariableId":26},{"Value":"BMW MANUFACTURER CORPORATION BMW NORTH AMERICA","ValueId":"968","Variable":"Manufacturer Name","VariableId":27},{"Value":"X3","ValueId":"1719","Variable":"Model","VariableId":28},{"Value":"2011","ValueId":"","Variable":"Model Year","VariableId":29},{"Value":"Munich","ValueId":"","Variable":"Plant City","VariableId":31},{"Value":"X3","ValueId":"","Variable":"Series","VariableId":34},{"Value":"xDrive35i","ValueId":"","Variable":"Trim","VariableId":38},{"Value":"MULTIPURPOSE PASSENGER VEHICLE (MPV)","ValueId":"7","Variable":"Vehicle Type","VariableId":39},{"Value":"Germany","ValueId":"2","Variable":"Plant Country","VariableId":75},{"Value":null,"ValueId":"","Variable":"Plant Company Name","VariableId":76},{"Value":null,"ValueId":"","Variable":"Plant State","VariableId":77},{"Value":"SAV","ValueId":"","Variable":"Trim2","VariableId":109},{"Value":null,"ValueId":"","Variable":"Series2","VariableId":110},{"Value":null,"ValueId":"","Variable":"Note","VariableId":114},{"Value":null,"ValueId":"","Variable":"Base Price ($)","VariableId":136},{"Value":"968","ValueId":"","Variable":"Manufacturer Id","VariableId":157},{"Value":null,"ValueId":"","Variable":"Cash For Clunkers","VariableId":158},{"Value":"Sport Utility Vehicle (SUV)Multi Purpose Vehicle (MPV)","ValueId":"7","Variable":"Body Class","VariableId":5},{"Value":"4","ValueId":"","Variable":"Doors","VariableId":14},{"Value":null,"ValueId":"","Variable":"Windows","VariableId":40},{"Value":null,"ValueId":null,"Variable":"Wheel Base Type","VariableId":60},{"Value":null,"ValueId":"","Variable":"Track Width","VariableId":159},{"Value":"Class 1D: 5,001 - 6,000 lb (2,268 - 2,722 kg)","ValueId":"13","Variable":"Gross Vehicle Weight Rating","VariableId":25},{"Value":null,"ValueId":"","Variable":"Bed Length (inches)","VariableId":49},{"Value":null,"ValueId":"","Variable":"Curb Weight (pounds)","VariableId":54},{"Value":null,"ValueId":"","Variable":"Wheel Base (inches)","VariableId":111},{"Value":null,"ValueId":"","Variable":"Wheel Base (inches) up to","VariableId":112},{"Value":null,"ValueId":null,"Variable":"Bed Type","VariableId":3},{"Value":null,"ValueId":null,"Variable":"Cab Type","VariableId":4},{"Value":null,"ValueId":null,"Variable":"Trailer Type Connection","VariableId":116},{"Value":null,"ValueId":null,"Variable":"Trailer Body Type","VariableId":117},{"Value":null,"ValueId":"","Variable":"Trailer Length (feet)","VariableId":118},{"Value":null,"ValueId":"","Variable":"Other Trailer Info","VariableId":155},{"Value":null,"ValueId":"","Variable":"Number of Wheels","VariableId":115},{"Value":null,"ValueId":"","Variable":"Wheel Size Front (inches)","VariableId":119},{"Value":null,"ValueId":"","Variable":"Wheel Size Rear (inches)","VariableId":120},{"Value":null,"ValueId":null,"Variable":"Entertainment System","VariableId":23},{"Value":null,"ValueId":null,"Variable":"Steering Location","VariableId":36},{"Value":null,"ValueId":"","Variable":"Number of Seats","VariableId":33},{"Value":null,"ValueId":"","Variable":"Number of Seat Rows","VariableId":61},{"Value":null,"ValueId":null,"Variable":"Transmission Style","VariableId":37},{"Value":null,"ValueId":"","Variable":"Transmission Speeds","VariableId":63},{"Value":null,"ValueId":null,"Variable":"Drive Type","VariableId":15},{"Value":null,"ValueId":"","Variable":"Axles","VariableId":41},{"Value":null,"ValueId":null,"Variable":"Axle Configuration","VariableId":145},{"Value":null,"ValueId":null,"Variable":"Brake System Type","VariableId":42},{"Value":null,"ValueId":"","Variable":"Brake System Description","VariableId":52},{"Value":null,"ValueId":"","Variable":"Battery Info","VariableId":1},{"Value":null,"ValueId":null,"Variable":"Battery Type","VariableId":2},{"Value":null,"ValueId":"","Variable":"Number of Battery Cells per Module","VariableId":48},{"Value":null,"ValueId":"","Variable":"Battery Current (Amps)","VariableId":57},{"Value":null,"ValueId":"","Variable":"Battery Voltage (Volts)","VariableId":58},{"Value":null,"ValueId":"","Variable":"Battery Energy (KWh)","VariableId":59},{"Value":null,"ValueId":null,"Variable":"EV Drive Unit","VariableId":72},{"Value":null,"ValueId":"","Variable":"Battery Current (Amps) up to","VariableId":132},{"Value":null,"ValueId":"","Variable":"Battery Voltage (Volts) up to","VariableId":133},{"Value":null,"ValueId":"","Variable":"Battery Energy (KWh) up to","VariableId":134},{"Value":null,"ValueId":"","Variable":"Number of Battery Modules per Pack","VariableId":137},{"Value":null,"ValueId":"","Variable":"Number of Battery Packs per Vehicle","VariableId":138},{"Value":null,"ValueId":null,"Variable":"Charger Level","VariableId":127},{"Value":null,"ValueId":"","Variable":"Charger Power (KW)","VariableId":128},{"Value":"6","ValueId":"","Variable":"Engine Number of Cylinders","VariableId":9},{"Value":"2979.1682352","ValueId":"","Variable":"Displacement (CC)","VariableId":11},{"Value":"181.8","ValueId":"","Variable":"Displacement (CI)","VariableId":12},{"Value":"3.0","ValueId":"","Variable":"Displacement (L)","VariableId":13},{"Value":null,"ValueId":"","Variable":"Engine Stroke Cycles","VariableId":17},{"Value":null,"ValueId":"","Variable":"Engine Model","VariableId":18},{"Value":"223.7100","ValueId":"","Variable":"Engine Power (KW)","VariableId":21},{"Value":"Gasoline","ValueId":"4","Variable":"Fuel Type - Primary","VariableId":24}]}';
    @isTest static void testCreateResultObject(){
        List<Object> listResponse= new List<Object>();
        Map<String,Object> resultsMap= ( Map < String,
		Object >) JSON.deserializeUntyped(testJsonResponse);
        List <Object > objectResult= ( List <Object> ) resultsMap.get('Results');
        
        List<ObjectManagement.validationObject> valObjList=ObjectManagement.createResultObject(objectResult);

        Set<String> validVariables = new Set<String> { 
        'Fuel Type - Primary', 
        'Manufacturer Name', 
        'Model',
        'Model Year',
        'Error Code',
        'Bed Length (inches)',
        'Engine Number of Cylinders',
        'Number of Seats',
        'Windows',
        'Doors',
        'Drive Type',
        'Engine Model',
        'Series',
        'Vehicle Type'
    };


        Integer numberOfFields=0;

        for (ObjectManagement.validationObject vo: valObjList) {
            if(vo.attribute=='Fuel Type - Primary'||vo.attribute=='Manufacturer Name'||vo.attribute=='Model'||vo.attribute=='Model Year'||vo.attribute=='Error Code'||vo.attribute=='Bed Length (inches)'||vo.attribute=='Engine Number of Cylinders'||vo.attribute=='Number of Seats'||vo.attribute=='Windows'||vo.attribute=='Doors'||vo.attribute=='Drive Type'||vo.attribute=='Engine Model'||vo.attribute=='Series'||vo.attribute=='Vehicle Type'){
                numberOfFields++;
            }
        }


         System.assertEquals(14, numberOfFields);


    }
    @isTest static void testOpenClass(){
          List<Object> listResponse= new List<Object>();
        Map<String,Object> resultsMap= ( Map < String,
		Object >) JSON.deserializeUntyped(testJsonResponse);
        List <Object > objectResult= ( List <Object> ) resultsMap.get('Results');
        List<ObjectManagement.validationObject> valObjList=ObjectManagement.createResultObject(objectResult);
        Boolean vinFound;
        Opportunity opp = new Opportunity();
        
        opp.CloseDate=date.today().addMonths(2);
		opp.Name='test opp';
        opp.StageName='Pledged';
        opp.VIN_Number__c='5UXWX7C5*BA';
        opp.Year__c='2011';
        Account acc= new Account(Name='Test Account');
        opp.AccountId=acc.Id;
        Make__c make= new Make__c(Name='test Make');
        insert make;

 	    Model__c model = new Model__c(Name='Test Model');
       	model.Make__c=make.Id;
        
        insert model;
        
        opp.Model__c= model.Id;
        

        insert opp;

        
        VinValidationObject results= ObjectManagement.openClass(valObjList, vinFound, opp.Id, opp.VIN_Number__c);

        
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

        VinValidationObject expectedObject= new VinValidationObject(bedLenght,cylinder,doors,driveType,engineModel,fuelType,makeObj,manufacter,modelObj,modelYear,seats,opp.Id,series,type,name,windows);
        System.assertEquals(TRUE,(expectedObject.bedLength==results.bedLength||expectedObject.doors==results.doors||expectedObject.seats==results.seats||expectedObject.windows==results.windows||expectedObject.cylinder==results.cylinder||expectedObject.driveType==results.driveType||expectedObject.engineModel==results.engineModel||expectedObject.fuelType==results.fuelType||expectedObject.make==results.make||expectedObject.manufacter==results.manufacter||expectedObject.model==results.model||expectedObject.modelYear==results.modelYear||expectedObject.series==results.series||expectedObject.type==results.type||expectedObject.name==results.name));



    }
}
