@IsTest
public class DivvyTestDataFactory {
  public static DivvyShareSObject createShareSObjectWithRecord() {
    DivvyShareSObject shareSObject =
        new DivvyShareSObject(Account.SObjectType);

    Account newAccount = new Account(Name='Test Account');
    Group newGroup = new Group(Name='Test Group');

    insert newAccount;
    insert newGroup;

    shareSObject.buildRecord(
        newAccount.Id,
        newGroup.Id,
        DivvyAccessLevel.EDIT
    );

    return shareSObject;
  }

  public static List<DivvyShareSObject> createMockShareSObjects(Integer count) {
    List<DivvyShareSObject> shareSObjectList =
        new List<DivvyShareSObject>();

    for(Integer i = 0; i < count; i++){
      DivvyShareSObject shareSObject =
          new DivvyShareSObject(Account.SObjectType);

      shareSObject.record = new AccountShare(
          Id=fflib_IDGenerator.generate(AccountShare.SObjectType),
          AccountId=fflib_IDGenerator.generate(Account.SObjectType),
          AccountAccessLevel='Edit',
          UserOrGroupId=fflib_IDGenerator.generate(User.SObjectType)
      );

      shareSObjectList.add(shareSObject);
    }

    return shareSObjectList;
  }
}