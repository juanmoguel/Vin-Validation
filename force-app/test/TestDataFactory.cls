@isTest
public class TestDataFactory {
    public static String createAccount() {
        Account acc= new Account(Name='Test Account');
        insert acc;
        return acc.Id;
    }
    public static String createMake(){
        Make__c make= new Make__c(Name='test Make');
        insert make;
        return make.Id;
    }
    public static String createModel(String makeId){
         Model__c model = new Model__c(Name='Test Model');
       	model.Make__c=makeId;
        
        insert model;
        return model.Id;
    }
    
    public static String createOpp(){
        Opportunity opp = new Opportunity();
        opp.CloseDate=date.today().addMonths(2);
		opp.Name='test opp';
        opp.StageName='Pledged';
        opp.VIN_Number__c='1G1ND52J3Y6165605';
        opp.Year__c='2003';
        String makeId=createMake();
        opp.Model__c= createModel(makeId);
        opp.AccountId=createAccount();
        insert opp;
        return opp.Id;
    }
}
