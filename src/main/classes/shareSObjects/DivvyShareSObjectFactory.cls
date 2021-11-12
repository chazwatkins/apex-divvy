public class DivvyShareSObjectFactory {
  protected Map<Schema.SObjectType, DivvyShareSObject> shareSObjects = new Map<Schema.SObjectType, DivvyShareSObject>();

  public SObject newInstance(Id recordId, Id userOrGroupId) {
    return newInstance(recordId, userOrGroupId, DivvyAccessLevel.NONE);
  }

  public SObject newInstance(
    Id recordId,
    Id userOrGroupId,
    DivvyAccessLevel accessLevel
  ) {
    DivvyShareSObject divvyShareSObject = getDivvyShareSObjectFromId(recordId);

    SObject shareSObject = divvyShareSObject.sObjectType.newSObject();

    shareSObject.put(divvyShareSObject.fields.parentIdFieldName, userOrGroupId);
    shareSObject.put(
      divvyShareSObject.fields.accessLevelFieldName,
      accessLevelToString(accessLevel)
    );
    shareSObject.put('UserOrGroupId', userOrGroupId);

    return shareSObject;
  }

  private DivvyShareSObject getDivvyShareSObjectFromId(Id recordId) {
    Schema.SObjectType sObjectType = recordId.getSobjectType();

    if (!shareSObjects.keySet().contains(sObjectType)) {
      shareSObjects.put(sObjectType, new DivvyShareSObject(sObjectType));
    }

    return shareSObjects.get(sObjectType);
  }

  private String accessLevelToString(DivvyAccessLevel accessLevel) {
    return accessLevel.name().toLowerCase().capitalize();
  }
}
