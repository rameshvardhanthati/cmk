/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require(["com/changemaker/home/homepage/test/integration/AllJourneys"
	], function () {
		QUnit.start();
	});
});
