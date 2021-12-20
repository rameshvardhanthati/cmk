sap.ui.define([
    'sap/m/library',
    "sap/ui/core/mvc/Controller"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (mobileLibrary, Controller) {
        "use strict";

        //var URLHelper = mobileLibrary.URLHelper;

        return Controller.extend("com.changemaker.home.homepage.controller.Home", {
            onInit: function () {

            },

            pressProjectWizard: function(url, newTab) {
                sap.ui.require([ "sap/m/library" ], ({URLHelper}) => URLHelper.redirect(url, newTab));
            },

            handleUrlPress: function () {
                var URLHelper = mobileLibrary.URLHelper;                
                let evt = "https://www.sap.com"
                URLHelper.redirect(evt, true);
            }
        });
    });
