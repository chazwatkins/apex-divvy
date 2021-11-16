@IsTest
private class DivvyShareSObjectFieldsTest {
  @IsTest
  static void propertiesAreSetCorrectlyTest() {
    DivvyParentSObject parent =
        new DivvyParentSObject(Account.SObjectType);

    DivvyShareSObjectFields fields =
        new DivvyShareSObjectFields(
            parent,
            AccountShare.SObjectType
        );

    System.assertEquals('AccountId', fields.parentIdFieldName);
    System.assertEquals('AccountAccessLevel', fields.accessLevelFieldName);
    System.assertEquals('UserOrGroupId', fields.userOrGroupFieldName);
  }
}