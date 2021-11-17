@IsTest
private class DivvyTestDataFactoryTest {
  @IsTest
  static void createShareSObjectWithRecord() {
    DivvyShareSObject shareSObject =
        DivvyTestDataFactory.createShareSObjectWithRecord();

    Id oppId = (Id)shareSObject.record.get('OpportunityId');
    Id groupId = (Id)shareSObject.record.get('UserOrGroupId');
    String accessLevel = (String)shareSObject.record.get('OpportunityAccessLevel');

    System.assertEquals(OpportunityShare.SObjectType, shareSObject.sObjectType);
    System.assertEquals(Opportunity.SObjectType, oppId.getSobjectType());
    System.assertEquals(Group.SObjectType, groupId.getSobjectType());
    System.assertEquals('Edit', accessLevel);
  }

  @IsTest
  static void createMockShareSObjects() {
    Integer shareSObjectsToCreate = 100;
    List<DivvyShareSObject> shareSObjects =
        DivvyTestDataFactory.createMockShareSObjects(shareSObjectsToCreate);

    System.assertEquals(shareSObjectsToCreate, shareSObjects.size());
  }
}