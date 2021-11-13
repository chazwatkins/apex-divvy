public class DivvyShareSObject {
  public Schema.SObjectType sObjectType {get; private set;}
  public String name {get; private set;}
  public DivvyParentSObject parentSObject {get; private set;}
  public DivvyShareSObjectFields fields {get; private set;}
  public SObject record;

  public DivvyShareSObject(Schema.SObjectType parentSObjectType) {
    this.parentSObject = new DivvyParentSObject(parentSObjectType);
    this.name = getShareSObjectName();
    this.sObjectType = getShareSObjectType();

    this.fields = new DivvyShareSObjectFields(
      this.parentSObject,
      this.sObjectType
    );

    this.record = this.sObjectType.newSObject();
  }

  public void buildRecord(Id recordId, Id userOrGroupId, DivvyAccessLevel accessLevel) {
    this.record = this.sObjectType.newSObject();
    this.record.put(this.fields.parentIdFieldName, recordId);
    this.record.put(this.fields.userOrGroupFieldName, userOrGroupId);
    this.record.put(this.fields.accessLevelFieldName, accessLevelToString(accessLevel));
  }

  private String getShareSObjectName() {
    String recordShareSObjectNameSuffix = 'Share';
    String recordShareSObjectName;

    String sObjName = this.parentSObject.name;

    if (this.parentSObject.isCustom) {
      recordShareSObjectName = sObjName.replace(
        '__c',
        '__' + recordShareSObjectNameSuffix
      );
    } else {
      recordShareSObjectName = sObjName + recordShareSObjectNameSuffix;
    }

    return recordShareSObjectName;
  }

  private Schema.SObjectType getShareSObjectType() {
    Object objectFromType = Type.forName(this.name).newInstance();
    SObject shareSObject = (SObject) objectFromType;

    Schema.SObjectType recordShareSObjectType = shareSObject.getSObjectType();

    return recordShareSObjectType;
  }

  private String accessLevelToString(DivvyAccessLevel accessLevel) {
    return accessLevel.name().toLowerCase().capitalize();
  }
}
