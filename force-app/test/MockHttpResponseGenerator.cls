@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    private String url = 'https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/1FMDU74W03UC62672?format=json&modelyear=2003';
    private String testJsonResponse = '{"Count":131,"Message":"Results returned successfully","SearchCriteria":"VIN:1FMDU74W03UC62672","Results":[{"Value":"","ValueId":"","Variable":"Suggested VIN","VariableId":142},{"Value":"0 - VIN decoded clean. Check Digit (9th position) is correct","ValueId":"0","Variable":"Error Code","VariableId":143},{"Value":"","ValueId":"","Variable":"Possible Values","VariableId":144},{"Value":null,"ValueId":"","Variable":"Additional Error Text","VariableId":156},{"Value":null,"ValueId":null,"Variable":"Destination Market","VariableId":10},{"Value":"FORD","ValueId":"460","Variable":"Make","VariableId":26},{"Value":"FORD MOTOR COMPANY, USA","ValueId":"976","Variable":"Manufacturer Name","VariableId":27},{"Value":"Explorer","ValueId":"1800","Variable":"Model","VariableId":28},{"Value":"2003","ValueId":"","Variable":"Model Year","VariableId":29},{"Value":"Louisville","ValueId":"","Variable":"Plant City","VariableId":31},{"Value":"Eddie Bauer","ValueId":"","Variable":"Series","VariableId":34},{"Value":null,"ValueId":"","Variable":"Trim","VariableId":38},{"Value":"MULTIPURPOSE PASSENGER VEHICLE (MPV)","ValueId":"7","Variable":"Vehicle Type","VariableId":39},{"Value":"United States (USA)","ValueId":"6","Variable":"Plant Country","VariableId":75},{"Value":"Louisville","ValueId":"","Variable":"Plant Company Name","VariableId":76},{"Value":"Kentucky","ValueId":"","Variable":"Plant State","VariableId":77},{"Value":null,"ValueId":"","Variable":"Trim2","VariableId":109},{"Value":null,"ValueId":"","Variable":"Series2","VariableId":110},{"Value":null,"ValueId":"","Variable":"Note","VariableId":114},{"Value":null,"ValueId":"","Variable":"Base Price ($)","VariableId":136},{"Value":"976","ValueId":"","Variable":"Manufacturer Id","VariableId":157},{"Value":null,"ValueId":"","Variable":"Cash For Clunkers","VariableId":158},{"Value":"Sport Utility Vehicle (SUV)Multi Purpose Vehicle (MPV)","ValueId":"7","Variable":"Body Class","VariableId":5},{"Value":"4","ValueId":"","Variable":"Doors","VariableId":14},{"Value":null,"ValueId":"","Variable":"Windows","VariableId":40},{"Value":null,"ValueId":null,"Variable":"Wheel Base Type","VariableId":60},{"Value":null,"ValueId":"","Variable":"Track Width","VariableId":159},{"Value":"Class 1D: 5,001 - 6,000 lb (2,268 - 2,722 kg)","ValueId":"13","Variable":"Gross Vehicle Weight Rating","VariableId":25},{"Value":null,"ValueId":"","Variable":"Bed Length (inches)","VariableId":49},{"Value":null,"ValueId":"","Variable":"Curb Weight (pounds)","VariableId":54},{"Value":null,"ValueId":"","Variable":"Wheel Base (inches)","VariableId":111},{"Value":null,"ValueId":"","Variable":"Wheel Base (inches) up to","VariableId":112}]}';
    
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {    
        System.assert(req.getEndpoint().startsWithIgnoreCase(url));
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(testJsonResponse);
        res.setStatusCode(200);
        return res;
    }
}