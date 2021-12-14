namespace app.changemaker;

using { Country } from '@sap/cds/common';
using { managed } from '@sap/cds/common';

type BusinessKey : String(10);
type SDate : DateTime;
type LText : String(1024);

type CompanyType : Association to cmk.common.CompanyType;
type DocType : Association to cmk.common.DocType;
type ReportType : Association to cmk.common.ReportType;
type KPIType : Association to cmk.common.KPIType;
type ProjectStatus : Association to cmk.common.ProjectStatus;
type CustomerStatus : Association to cmk.common.CustomerStatus;
type AnticipatedReaction : Association to cmk.common.AnticipatedReaction;
type InfluenceLevel : Association to cmk.common.InfluenceLevel;
type Attitude : Association to cmk.common.Attitude;
type ChangeImpact : Association to cmk.common.ChangeImpact;
type Gender : Association to cmk.common.Gender;
type Title : Association to cmk.common.Title;
type SAPSystem : Association to cmk.common.SAPSystem;
type Industry : Association to cmk.common.Industry;
type MIMEType : Association to cmk.common.MIMEType;

type Timezone : Association to cmk.common.Timezone;

entity Commons : managed {
    VERSION : String(10);
    OWNER: BusinessKey;
}

entity Location : managed {
    KEY LOC_ID :	BusinessKey;
        UID	: String(10);
        City :	String(20);
        TIMEZONE : Timezone;
        COUNTRY	: Country;
        Customer : Association to one Customer;
}

entity Media : Commons {
    KEY Med_ID :	BusinessKey;
        UID : String(10);
        FileName : String(50);
        FolderPath : String(100);
        URL	: String(100);
        MIMEType : MIMEType;
}

entity Template : Commons {
    KEY Tem_ID :	BusinessKey;
        UID : String(10);
        Name : String(50);
        Description : String(100);
        Media : Association to one Media;
}

entity Document : Commons {
    KEY Doc_ID :	BusinessKey;
    UID	: String(10);
    Name : String(50);
    DocType	: DocType;
    Media : Association to one Media;
}

entity BusinessUnit : Commons {
    KEY BU_ID :	BusinessKey;
        UID : String(10);
        Location : Association to one Location;
        Address : Association to one Address;
        BUHead	: Association to one Employee;
        Customer : Association to one Customer;

}
entity Address : Commons {
    KEY Add_Id : BusinessKey;
        HouseName :	String(20);
        Street1 :	String(40);
        Street2 :	String(40);
        City :	String(40);
        County : String(40);
        State : String(40);
        ZipCODE	: String(10);
        Country : Country;
        Email : String(50);
        PrimaryPhone : String(20);
        Mobile:	String(20);
}

entity Company : Commons {
    KEY COM_ID : BusinessKey;
        UID	: String(10);
        Name : String(50);
        Type : CompanyType;
        Location : Association to one Location;
        Address : Association to one Address;
        KeyContact : Association to one Employee;
        Employees :	Composition of many Employee on Employees.Company = $self;  
}

entity Customer : Commons {
	key CUST_ID : BusinessKey;
		UID	: String(20);
        Name : String(50);
		Domain	: String(10);
        Status : CustomerStatus;
        AdminContact : Association to one Employee;
        Projects : Composition of many Project on Projects.Customer = $self;
        BusinessUnits : Composition of many BusinessUnit on BusinessUnits.Customer = $self;
        Locations : Composition of many Location on Locations.Customer = $self;
        Industry : Industry;
        Logo : Association to one Media;
        Address	: Association to one Address;
        Employees : Composition of many Employee on Employees.Customer = $self;
        Documents : Composition of many Document on Documents.OWNER = CUST_ID;
        Templates : Composition of many Template on Templates.OWNER = CUST_ID;
};

entity Employee : Commons {
	key EMP_ID : BusinessKey;
        UID	:  String(100);
        FirstName : String(30);
        LastName : String(30);
        MiddleName : String(30);
        MobileNumber : String(20);
        DOB : Date;
        Gender : Gender;
        Title : Title;
        IdentityDocument : Association to one Media;
        Address	: Association to one Address;
        Location : Association to one Location;
        BusinessUnit : Association to one BusinessUnit;
        Company	: Association to one Company;
        Customer : Association to one Customer;

        //Roles : Coll<Role>
        //FunctionalArea : FunctionalArea
        //Region : Region
        //Team : Team

}

entity Project : Commons {
	key Proj_ID : BusinessKey;
        Customer : association to one Customer;
		Title	: String(12);
		Purpose	: LText;
        ChangeManager :	association to one Employee;
        SAPSystems :	SAPSystem;
        SystemIntegrator : association to one Company;
        OCMPartner : association to one Company;
        Timeframe : association to one Timeframe;
        Status : ProjectStatus;
        KPIs : Composition of many KPI on KPIs.Project=$self;

    //StakeholderGroups	Coll<StakeHolderGroup>
    //Consultants	Coll<OCMCons>
    //Documents	Coll<Document>
    //Media	Coll<Media>
    //Report	Coll<Report>
    //Dashboards	Coll<Dashboard>

};

entity Timeframe : Commons {
	key TF_ID : BusinessKey;
        StartDate :	Date;
        EndDate	: Date;
        Duration : Integer; // In Days

}

entity KPI : Commons {
	key KPI_ID : BusinessKey;
        Project : association to one Project;
		Type : KPIType;
        TargetPer :	Double;

}




//LOOKUP ENUMS

context cmk.common {
    entity Timezone {
        key code   : String(3) @(title : '{i18n>timezone}');
            name  : localized String(255)  @title : '{i18n>Name}';
            descr : localized String(1000) @title : '{i18n>Description}';
    };

    entity CompanyType {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity DocType {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity ReportType {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity KPIType {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity ProjectStatus {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity CustomerStatus {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity AnticipatedReaction {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity InfluenceLevel {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity Attitude {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity ChangeImpact {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity Gender {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity Title {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity SAPSystem {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity Industry {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

    entity MIMEType {
        key KEY_ID : BusinessKey;
            KEYNAME: String(25);
            VALUE: String(50);
            DESCRIPTION: String(400);
    };

}