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
                this._wizard = this.byId("CreateProductWizard");
                this._oNavContainer = this.byId("wizardNavContainer");
                this._oWizardContentPage = this.byId("wizardContentPage");
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
			},

            onCustomerChange: function(oEvent) {
                let IndustryLabel = this.getView().byId("cbIndustry");
                //let SystemIntegratorLabel = this.getView().byId("SystemIntegratorChosen");
                var sIndustry = oEvent.oSource.mProperties.selectedKey;
                IndustryLabel.setValue(sIndustry);
                //SystemIntegratorLabel.setValue(oEvent.mParameters.newValue); 
            },

            onAdd: function () {
                let model = this.getView().getModel('kpiModel').getData();     
                model.push({title: '', percent: ''});
                this.getView().getModel('kpiModel').refresh();
            },

            setProductType: function (evt) {
                var productType = evt.getSource().getTitle();
                this.model.setProperty("/productType", productType);
                this.byId("ProductStepChosenType").setText("Chosen product type: " + productType);
                this._wizard.validateStep(this.byId("ProductTypeStep"));
            },
    
            setProductTypeFromSegmented: function (evt) {
                var productType = evt.getParameters().item.getText();
                this.model.setProperty("/productType", productType);
                this._wizard.validateStep(this.byId("ProductTypeStep"));
            },
    
            additionalInfoValidation: function () {
                var name = this.byId("ProductName").getValue();
                var weight = parseInt(this.byId("ProductWeight").getValue());
    
                if (isNaN(weight)) {
                    this.model.setProperty("/productWeightState", "Error");
                } else {
                    this.model.setProperty("/productWeightState", "None");
                }
    
                if (name.length < 6) {
                    this.model.setProperty("/productNameState", "Error");
                } else {
                    this.model.setProperty("/productNameState", "None");
                }
    
                if (name.length < 6 || isNaN(weight)) {
                    this._wizard.invalidateStep(this.byId("ProductInfoStep"));
                } else {
                    this._wizard.validateStep(this.byId("ProductInfoStep"));
                }
            },
    
            optionalStepActivation: function () {
                MessageToast.show(
                    'This event is fired on activate of Step3.'
                );
            },
    
            optionalStepCompletion: function () {
                MessageToast.show(
                    'This event is fired on complete of Step3. You can use it to gather the information, and lock the input data.'
                );
            },
    
            pricingActivate: function () {
                this.model.setProperty("/navApiEnabled", true);
            },
    
            pricingComplete: function () {
                this.model.setProperty("/navApiEnabled", false);
            },
    
            scrollFrom4to2: function () {
                this._wizard.goToStep(this.byId("ProductInfoStep"));
            },
    
            goFrom4to3: function () {
                if (this._wizard.getProgressStep() === this.byId("PricingStep")) {
                    this._wizard.previousStep();
                }
            },
    
            goFrom4to5: function () {
                if (this._wizard.getProgressStep() === this.byId("PricingStep")) {
                    this._wizard.nextStep();
                }
            },
    
            wizardCompletedHandler: function () {
                //create model
                let kpiForm = this.getView().byId("kpiForm");
                kpiForm.destroyContent();

                let customerName = this.getView().byId("cbCustomer").mProperties.value;
                let industryName = this.getView().byId("cbIndustry").mProperties.value;
                let productName = this.getView().byId("cbProductName").mProperties.value;
                let purposeStatement = this.getView().byId("cbPurposeStatement").mProperties.value;
                let dateRange = this.getView().byId("cmfDateRangeSelection").mProperties.dateValue;
                console.log(dateRange);
                let location = this.getView().byId("cmfLocation").mProperties.value;
                let SAPSystem = this.getView().byId("cbSAPSystem").mProperties.value;
                let systemIntegrator = this.getView().byId("cbSystemIntegrator").mProperties.value;
                let OCMPartner = this.getView().byId("cbOCM").mProperties.value;
                let ChangeManager = this.getView().byId("cmfChangeManager").mProperties.value;
                let status = this.getView().byId("cmfStatus").mProperties.value;
                let kpiItems = this.getView().byId("KPITable").getItems();
                let kpiStorage = [];
                let kpi = kpiItems.forEach(function(kpi){                  
                    kpiStorage.push({"title": kpi.mAggregations.cells[0].mProperties.value, "percentage": kpi.mAggregations.cells[1].mProperties.value});
                }); 
                var data = {name : customerName, industry: industryName, product: productName, purposestatement: purposeStatement, date: dateRange, location: location, SAPsystem: SAPSystem, systemintegrator: systemIntegrator, ocmpartner: OCMPartner, changemanager: ChangeManager, status: status, kpi: kpiStorage};
                console.log(data);
                var oModel = new JSONModel(data); // Only set data here.
                this.getView().setModel(oModel, "reviewModel");
                
                kpiStorage.forEach(function(data){
                    var lab = new sap.m.Label();
                    lab.setText(data.title);
                    kpiForm.addContent(lab);
                    var text = new sap.m.Text();
                    text.setText(data.percentage + " %");
                    kpiForm.addContent(text);
                });
                var editThree = new sap.m.Link();
                editThree.setText("Edit");
                editThree.attachPress(this.editStepThree, this);
                kpiForm.addContent(editThree);

                
                this._oNavContainer.to(this.byId("wizardReviewPage"));

            },
    
            backToWizardContent: function () {
                this._oNavContainer.backToPage(this._oWizardContentPage.getId());
            },
    
            editStepOne: function () {
                this._handleNavigationToStep(0);
            },
    
            editStepTwo: function () {
                this._handleNavigationToStep(1);
            },
    
            editStepThree: function () {
                this._handleNavigationToStep(2);
            },
    
            _handleNavigationToStep: function (iStepNumber) {
                var fnAfterNavigate = function () {
                    this._wizard.goToStep(this._wizard.getSteps()[iStepNumber]);
                    this._oNavContainer.detachAfterNavigate(fnAfterNavigate);
                }.bind(this);
    
                this._oNavContainer.attachAfterNavigate(fnAfterNavigate);
                this.backToWizardContent();
            },
    
            _handleMessageBoxOpen: function (sMessage, sMessageBoxType) {
                MessageBox[sMessageBoxType](sMessage, {
                    actions: [MessageBox.Action.YES, MessageBox.Action.NO],
                    onClose: function (oAction) {
                        if (oAction === MessageBox.Action.YES) {
                            this._handleNavigationToStep(0);
                            this._wizard.discardProgress(this._wizard.getSteps()[0]);
                        }
                    }.bind(this)
                });
            },
    
            _setEmptyValue: function (sPath) {
                this.model.setProperty(sPath, "n/a");
            },
    
            handleWizardCancel: function () {
                this._handleMessageBoxOpen("Are you sure you want to cancel your report?", "warning");
            },
    
            handleWizardSubmit: function () {
                this._handleMessageBoxOpen("Are you sure you want to submit your report?", "confirm");
            },
    
            productWeighStateFormatter: function (val) {
                return isNaN(val) ? "Error" : "None";
            },
    
            discardProgress: function () {
                this._wizard.discardProgress(this.byId("ProductTypeStep"));
    
                var clearContent = function (content) {
                    for (var i = 0; i < content.length; i++) {
                        if (content[i].setValue) {
                            content[i].setValue("");
                        }
    
                        if (content[i].getContent) {
                            clearContent(content[i].getContent());
                        }
                    }
                };
    
                this.model.setProperty("/productWeightState", "Error");
                this.model.setProperty("/productNameState", "Error");
                clearContent(this._wizard.getSteps());
            }


		});
	});
