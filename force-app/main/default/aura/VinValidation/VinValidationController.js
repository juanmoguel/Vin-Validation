({
    validate: function(component, event, helper) {
        var vinNumber = component.get("v.vinNumber");
        var vinYear = component.get("v.year");
        console.debug(vinNumber + vinYear);
        helper.getValidation(component, vinNumber, vinYear);

    }
})