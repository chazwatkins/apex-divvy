public class DivvyShareSObjectFields {
  public String parentIdFieldName;
  public String accessLevelFieldName;

  private Set<String> fieldSet;
  private String customSObjectParentIdFieldName = 'ParentId';
  private String customSObjectAccessLevelFieldName = 'AccessLevel';

  public DivvyShareSObjectFields(
    Divvy_ParentSObject parentSObject,
    Schema.SObjectType shareSObjectType
  ) {
    this.fieldSet = shareSObjectType.getDescribe().fields.getMap().keySet();

    this.parentIdFieldName = getParentIdFieldName(parentSObject);
    this.accessLevelFieldName = getShareSObjectAccessLevelFieldName(
      parentSObject
    );
  }

  private String getParentIdFieldName(Divvy_ParentSObject parentSObject) {
    if (hasCustomSObjectShareSObjectFields()) {
      return customSObjectParentIdFieldName;
    }

    return parentSObject.name + 'Id';
  }

  private String getShareSObjectAccessLevelFieldName(
    Divvy_ParentSObject parentSObject
  ) {
    if (hasCustomSObjectShareSObjectFields()) {
      return customSObjectAccessLevelFieldName;
    }

    return parentSObject.name + customSObjectAccessLevelFieldName;
  }

  private Boolean hasCustomSObjectShareSObjectFields() {
    Set<String> customSObjectShareSObjectFields = new Set<String>{
      customSObjectAccessLevelFieldName.toLowerCase(),
      customSObjectParentIdFieldName.toLowerCase()
    };

    return this.fieldSet.containsAll(customSObjectShareSObjectFields);
  }
}
