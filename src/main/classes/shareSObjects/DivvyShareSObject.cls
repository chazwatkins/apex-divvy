public class DivvyShareSObject {
  public Schema.SObjectType sObjectType;
  public String name;
  public DivvyParentSObject parentSObject;
  public DivvyShareSObjectFields fields;

  public DivvyShareSObject(Schema.SObjectType parentSObjectType) {
    this.parentSObject = new DivvyParentSObject(parentSObjectType);
    this.name = getShareSObjectName();
    this.sObjectType = getShareSObjectType();
    this.fields = new DivvyShareSObjectFields(
      this.parentSObject,
      this.sObjectType
    );
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
    Schema.SObjectType recordShareSObjectType = ((SObject) Type.forName(
          this.name
        )
        .newInstance())
      .getSObjectType();

    return recordShareSObjectType;
  }
}
