using CmkService as service from '../../srv/cmk_srv';

annotate service.Customer with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'CUST_ID',
            Value : CUST_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'VERSION',
            Value : VERSION,
        },
        {
            $Type : 'UI.DataField',
            Label : 'OWNER',
            Value : OWNER,
        },
        {
            $Type : 'UI.DataField',
            Label : 'UID',
            Value : UID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
    ]
);
annotate service.Customer with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'VERSION',
                Value : VERSION,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OWNER',
                Value : OWNER,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CUST_ID',
                Value : CUST_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'UID',
                Value : UID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Domain',
                Value : Domain,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status_KEY_ID',
                Value : Status_KEY_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'AdminContact_EMP_ID',
                Value : AdminContact_EMP_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Industry_KEY_ID',
                Value : Industry_KEY_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Logo_Med_ID',
                Value : Logo_Med_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Address_Add_Id',
                Value : Address_Add_Id,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
