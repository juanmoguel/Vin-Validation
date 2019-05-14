({
    getValidation: function(component, vinNumber, year, recordId) {
        var theUrl = 'https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/' + vinNumber + '?format=json&modelyear=' + year;
        var action = component.get("c.getCarInformation");
        action.setParams({
            "url": theUrl,
            "vinNumber": vinNumber,
            "oppId": recordId
        })

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.debug('--------> respuesta : ' + JSON.stringify(response.getReturnValue()));
            }
        });

        $A.enqueueAction(action);
    },
    getOppData: function(component, oppId, callback) {
        var action = component.get("c.getOpportunity");
        action.setParams({
            "recordId": oppId
        })

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.debug('--------> respuesta : ' + JSON.stringify(response.getReturnValue()));
                callback.call(this, response.getReturnValue());

            }
        });
        $A.enqueueAction(action);
    }
})