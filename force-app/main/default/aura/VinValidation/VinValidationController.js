({
    validate: function(component, event, helper) {

        var recordId = component.get("v.recordId");
        console.debug("id es: " + recordId);
        helper.getOppData(component, recordId,
            function(response) {
                var apexResponse = response;
                var vinNumber = response.VIN_Number__c;
                var vinYear = response.Year__c;
                console.debug("datos son:" + vinNumber + vinYear);
                helper.getValidation(component, vinNumber, vinYear, recordId);
            }
        );

    }
})