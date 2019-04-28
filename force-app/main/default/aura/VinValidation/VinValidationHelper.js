({
    getValidation: function(component, vinNumber, year) {
        var theUrl = 'https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/' + vinNumber + '?format=json&modelyear=' + year;
        var action = component.get("c.getCarInformation");
        action.setParams({
            "url": theUrl
        })

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.debug('--------> respuesta : ' + JSON.stringify(response.getReturnValue()));
            }
        });

        $A.enqueueAction(action);
    }
})