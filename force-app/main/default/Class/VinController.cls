public with sharing class VinController {
    @AuraEnabled
    public static Map<String,Object> getCarInformation(String url) {
        Http h= new Http();
        HttpRequest req= new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res= h.send(req);
        System.debug('response:--> ' + res.getBody());
        Map < String,
		Object > resultsMap = (Map < String, Object > ) JSON.deserializeUntyped(res.getBody());
		system.debug('resultsMap-->' + resultsMap);
 
		return resultsMap;
    }
}