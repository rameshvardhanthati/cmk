namespace app.changemaker;

using { Country } from '@sap/cds/common';
using { managed } from '@sap/cds/common';

type BusinessKey : String(10);
type SDate : DateTime;
type LText : String(1024);

//LOOKUP ENUMS
entity LookupTable {

	key LUV_ID : BusinessKey;
		LookupName	: String(10);
        LookupValue: String(50);
        DESCRIPTION: String(400);
};



entity Customer : managed {

	key CUST_ID : BusinessKey;
        PROJECTS  : Composition of one Project on PROJECTS.Customer = $self;
		DOMAIN	: String(10);
		UID	: String(10);
        NAME: String(50);
};

entity Project : managed {

	key PROJ_ID : BusinessKey;
    key Customer : association to Customer;
		TITLE	: String(12);
		PURPOSE	: LText;
};

