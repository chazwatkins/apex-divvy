public class DivvyTestDataFactory {
  public static DivvyShareSObject createShareSObjectWithRecord() {
    DivvyShareSObject shareSObject =
        new DivvyShareSObject(Opportunity.SObjectType);

    Opportunity newOpp = new Opportunity(Name='Test Account', StageName='Closed Won', CloseDate=System.today());
    Group newGroup = new Group(Name='Test Group');

    insert newOpp;
    insert newGroup;

    shareSObject.buildRecord(
        newOpp.Id,
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

      shareSObject.buildRecord(
          fflib_IDGenerator.generate(Account.SObjectType),
          fflib_IDGenerator.generate(User.SObjectType),
          DivvyAccessLevel.EDIT
      );

      shareSObjectList.add(shareSObject);
    }

    return shareSObjectList;
  }
}