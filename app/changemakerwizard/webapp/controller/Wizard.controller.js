sap.ui.define([
	"sap/ui/core/mvc/Controller",
    'sap/ui/model/json/JSONModel',
	"sap/m/MessageToast",
	"sap/m/MessageBox"
],
	/**
	 * @param {typeof sap.ui.core.mvc.Controller} Controller
	 */
	function (Controller, JSONModel, MessageToast, MessageBox) {
		"use strict";

		return Controller.extend("com.sap.changemaker.wizard.changemakerwizard.controller.Wizard", {
			onInit: function () {

                var oModel = this.getView().getModel();
                console.log(oModel);

                
            
                // oModel.read('/SAPSystem', {
                //     success: function(data) {
                //         console.log(data)
                //     },
                //     error: function(error) {
                //         console.log(error);
                //     }

                // });
                

			}
		});
	});
