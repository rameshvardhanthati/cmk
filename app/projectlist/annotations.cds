using CmkService as service from '../../srv/cmk_srv';

annotate service.Project with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Proj_ID',
            Value : Proj_ID,
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
            Label : 'Customer_CUST_ID',
            Value : Customer_CUST_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : Title,
        },
    ]
);
annotate service.Project with @(
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
                Label : 'Proj_ID',
                Value : Proj_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Customer_CUST_ID',
                Value : Customer_CUST_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : Title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Purpose',
                Value : Purpose,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ChangeManager_EMP_ID',
                Value : ChangeManager_EMP_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SAPSystems_KEY_ID',
                Value : SAPSystems_KEY_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SystemIntegrator_COM_ID',
                Value : SystemIntegrator_COM_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OCMPartner_COM_ID',
                Value : OCMPartner_COM_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Timeframe_TF_ID',
                Value : Timeframe_TF_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status_KEY_ID',
                Value : Status_KEY_ID,
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
