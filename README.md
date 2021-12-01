# Divvy

An easier way to do Apex record sharing.


```apex
Divvy myDivvy = new Divvy();

// One record to one User or Group
myDivvy.registerRead(mySObject.Id, userOrGroupId);
myDivvy.registerEdit(mySObject.Id, userOrGroupId);
myDivvy.RegisterRevoke(mySObject.Id, userOrGroupId);

// One record to many Users or Groups
myDivvy.registerRead(mySObject.Id, userOrGroupIdSet);
myDivvy.registerEdit(mySObject.Id, userOrGroupIdSet);
myDivvy.RegisterRevoke(mySObject.Id, userOrGroupIdSet);

// Many records to one User or Group
myDivvy.registerRead(recordIdSet, userOrGroupId);
myDivvy.registerEdit(recordIdSet, userOrGroupId);
myDivvy.RegisterRevoke(recordIdSet, userOrGroupId);

// Many records to many Users or Groups
myDivvy.registerRead(recordIdSet, userOrGroupIdSet);
myDivvy.registerEdit(recordIdSet, userOrGroupIdSet);
myDivvy.RegisterRevoke(recordIdSet, userOrGroupIdSet);

// Finally, write the Share Record updates to the database
myDivvy.commitShares();
```


## Why fix Apex record sharing?

It's best to show with some examples of how Apex Recording Sharing is done normally.


### Standard Objects

```apex
CaseShare myObjectShare =
    new CaseShare(
        CaseId=myObject.Id,
        CaseAccessLevel=...,
        UserOrGroupId=...
    );
```

Share SObject Name:

- name of the SObject being shared + Share

Share SObject Fields:

- CaseId - Id for Case SObject being shared
- CaseAccessLevel - Access Level to grant

*Note, both the fields include the name of the SObject being shared*

### Custom Objects

```apex
MyCustomObject__Share myObjectShare =
    new MyCustomObject__Share(
        ParentId=myObject.Id,
        AccessLevel=...,
        UserOrGroupId=...
    );
```

Share SObject Name:

- name of the SObject being shared + __Share

Share SObject Fields:

- ParentId - Id for Custom SObject being shared
- AccessLevel - Access Level to grant

*Note, both the fields do not include the name of the SObject being shared*


### Field Service Objects

```apex
ServiceAppointmentShare myObjectShare =
    new ServiceAppointmentShare(
        ParentId=myObject.Id,
        AccessLevel=...,
        UserOrGroupId=...
    );
```

Share SObject Name:

- name of the SObject being shared + Share

Share SObject Fields:

- ParentId - Id for Custom SObject being shared
- AccessLevel - Access Level to grant

*Note, both the fields do not include the name of the SObject being shared*

Wait... Aren't Field Service SObjects considered Standard?
Yes, they are.  Do a `getDescribe().isCustom()` and you'll see `false`.
However, Field Service, formerly Field Service Lightning and external to
Salesforce, SObjects used to be custom objects before Salesforce
acquired the company.  Now that Field Service is part of Salesforce, the
 `__c` and `__Share` were dropped, but the Share
SObject retains the Custom Share SObject field names.
