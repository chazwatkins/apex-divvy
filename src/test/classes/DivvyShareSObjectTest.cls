@IsTest
private class DivvyShareSObjectTest {
  @IsTest
  static void accessLevelToStringTest() {

    DivvyShareSObject shareSObject =
        new DivvyShareSObject(Account.SObjectType);

    String accessLevel =
        shareSObject.accessLevelToString(
            DivvyAccessLevel.EDIT
        );

    System.assertEquals('Edit', accessLevel);
  }

  @IsTest
  static void getShareSObjectTypeTest() {

    DivvyShareSObject shareSObject =
        new DivvyShareSObject(Account.SObjectType);

    System.assertEquals(
        AccountShare.SObjectType,
        shareSObject.getShareSObjectType()
    );
  }

  @IsTest
  static void getShareSObjectNameTest() {

    DivvyShareSObject shareSObject =
        new DivvyShareSObject(Account.SObjectType);

    System.assertEquals(
        'AccountShare',
        shareSObject.getShareSObjectName()
    );
  }

  @IsTest
  static void buildRecordTest() {

    DivvyShareSObject shareSObject =
        new DivvyShareSObject(Account.SObjectType);

    AccountShare newAccountShare =
        new AccountShare(
            AccountId=fflib_IDGenerator.generate(Account.SObjectType),
            AccountAccessLevel='Edit',
            UserOrGroupId=fflib_IDGenerator.generate(User.SObjectType)
        );

    shareSObject.buildRecord(
        newAccountShare.AccountId,
        newAccountShare.UserOrGroupId,
        DivvyAccessLevel.EDIT
    );

    System.assertEquals(
        AccountShare.SObjectType,
        shareSObject.record.getSObjectType()
    );

    System.assertEquals(
        newAccountShare.UserOrGroupId,
        shareSObject.record.get('UserOrGroupId')
    );

    System.assertEquals(
        newAccountShare.AccountId,
        shareSObject.record.get('AccountId')
    );

    System.assertEquals(
        'Edit',
        shareSObject.record.get('AccountAccessLevel')
    );
  }

  @IsTest
  static void propertiesAreSetCorrectlyTest() {

    DivvyShareSObject shareSObject =
        new DivvyShareSObject(Account.SObjectType);

    System.assertEquals(
        'AccountShare',
        shareSObject.getShareSObjectName()
    );
  }
}