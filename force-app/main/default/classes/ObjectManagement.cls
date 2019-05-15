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

    
    public static void doFunctions(List<validationObject> objectToInsert,String vinNumber,String oppId){
        String errorCode;
       
      

        for(validationObject vo:objecttoInsert){
            if(vo.attribute=='Error Code'){
                
                errorCode=vo.aValue;
                
            } 
        }

      

      Boolean vinFound=ResultsFunctions.validateCodeError(errorCode);
     


        ResultsFunctions.updateOppStatus(oppId,vinFound);
        openClass(objectToInsert, vinFound,oppId,vinNumber);

      
        
    }

    public static void openClass(List<validationObject> objectToInsert,Boolean vinFound,String oppId,String vinNumber){
        Decimal bedLenght=null;
        Integer doors=null;
        Integer seats=null;
        Integer windows=null;
        Integer cylinder=null;
        String driveType;
        String engineModel;
        String fuelType;
        String make;
        String manufacter;
        String model;
        String modelYear;
      
        String series;
        String type;
        String name='Validation of '+vinNumber;
       

        

        System.debug(objectToInsert.size());

         for(validationObject vo:objecttoInsert){
             if (vo.attribute=='Fuel Type - Primary') {
                fuelType=vo.aValue;
                 
            }

            else{
                if(vo.attribute=='Bed Length (inches)'){
                    if(vo.aValue!=null){
                        Integer intCheck = Integer.ValueOf(vo.aValue); 
                        bedLenght = Decimal.ValueOf(intCheck);
                        
                    }
                    
                }
                else{
                    if(vo.attribute=='Engine Number of Cylinders'){
                        if(vo.aValue!=null){
                            cylinder=Integer.valueof(vo.aValue);
                                           
                        }
                        
                    }
                    else{
                        if(vo.attribute=='Number of Seats'){
                            if(vo.aValue!=null){
                                seats=Integer.valueof(vo.aValue);
                                
                            }
                        }
                        else{
                             if(vo.attribute=='Windows'){
                                if(vo.aValue!=null){
                                    windows=Integer.valueof(vo.aValue);
                                    
                                }
                                
                             }

                             else{
                                if(vo.attribute=='Doors'){
                                    if(vo.aValue!=null){
                                        doors=Integer.valueof(vo.aValue);
                                         
                                    }
 
                                }
                                else {
                                    if(vo.attribute== 'Drive Type') {
                                         driveType=vo.aValue;
                                         
                                     }
                                     else{
                                        if (vo.attribute=='Engine Model')  {
                                                engineModel=vo.aValue;
                                                
                                        }
                                        else{
                                            if (vo.attribute=='Make') {
                                                make=vo.aValue;
                                                 
                                            }
                                            else{
                                                if (vo.attribute=='Manufacturer Name') {
                                                        manufacter=vo.aValue;
                                                         
                                                }

                                                else{
                                                    if (vo.attribute=='Model') {
                                                        model=vo.aValue;
                                                        
                                                    }      
                                                    else{
                                                        if (vo.attribute=='Model') {
                                                        model=vo.aValue;
                                                         
                                                        }
                                                         else{
                                                            if (vo.attribute=='Model Year')  {
                                                                modelYear=vo.aValue;
                                                                
                                                            }
                                                            else{

                                                                if (vo.attribute=='Series')  {
                                                                    series=vo.aValue;
                                                                     
                                                                }
                                                                else{
                                                                    if (vo.attribute=='Vehicle Type') {
                                                                    type=vo.aValue;
                                                                    
                                                                     }
                                                                }
                                                            }
                                                        }
                                                    }             
                                                }                           
                                            }
                                        }
                                     }
                                }
                             }
                        }

                    }

                }
            }
         }

         

        VinValidationObject theObject= new VinValidationObject(bedLenght,cylinder,doors,driveType,engineModel,fuelType,make,manufacter,model,modelYear,seats,oppId,series,type,name,windows);
        
        ResultsFunctions.insertValidationObject(vinFound,theObject);
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