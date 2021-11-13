public class DivvyShareSObjectFactory {

  public static DivvyShareSObject newInstance(
    Id recordId,
    Id userOrGroupId,
    DivvyAccessLevel accessLevel
  ) {

    Schema.SObjectType sObjType = recordId.getSobjectType();
    DivvyShareSObject shareSObject = new DivvyShareSObject(sObjType);

    shareSObject.buildRecord(recordId, userOrGroupId, accessLevel);

    return shareSObject;
  }
}
