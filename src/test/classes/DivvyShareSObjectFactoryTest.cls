@IsTest
private class DivvyShareSObjectFactoryTest {
  @IsTest
  static void createShareSObjectForAValidSObjectTypeTest() {

    Id accountId = fflib_IDGenerator.generate(Account.SObjectType);
    Id userId = fflib_IDGenerator.generate(User.SObjectType);

    DivvyShareSObject shareSObject =
        DivvyShareSObjectFactory.newInstance(
            accountId,
            userId,
            DivvyAccessLevel.EDIT
        );

    System.assertEquals(
        AccountShare.SObjectType,
        shareSObject.sObjectType
    );

    System.assert(shareSObject.record != null);

  }
}