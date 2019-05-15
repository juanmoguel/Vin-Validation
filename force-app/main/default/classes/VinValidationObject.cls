public with sharing class VinValidationObject {
    public VinValidationObject(Decimal bed,Integer cyli,Integer numberDoors,String drive,String engine,String fuel,String makeName,String manufacterName,String modelName,String year,Integer numberSeats,String opp,String seriesName,String driveType,String objName,Integer numberWindows ) {
        System.debug('entro obs');
            bedLength=bed;
            doors=numberDoors;
            cylinder=cyli;
            driveType=drive;
            engineModel=engine;
            fuelType=fuel;
            make=makeName;
            manufacter=manufacterName;
            model=modelName;
            modelYear=year;
            seats=numberSeats;
            oppId=opp;
            series=seriesName;
            type=fuelType;
            name=objName;
            windows=numberWindows;
    }

    public Decimal bedLength { get; private set;}
    public Integer cylinder{ get;private set;}
    public Integer doors{ get;private set;}
    public String driveType{ get;private set;}
    public String engineModel{ get;private set;}
    public String fuelType{ get;private set;}
    public String make{ get;private set;}
    public String manufacter{ get;private set;}
    public String model{ get;private set;}
    public String modelYear{ get;private set;}
    public Integer seats{ get;private set;}
    public String oppId{ get;private set;}
    public String series{ get;private set;}
    public String type{ get;private set;}
    public String name{ get;private set;}
    public Integer windows{ get;private set;}
}
