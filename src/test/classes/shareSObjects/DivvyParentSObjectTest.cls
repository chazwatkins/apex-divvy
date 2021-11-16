@IsTest
private class DivvyParentSObjectTest {
  @IsTest
  static void propertiesAreSetTest() {
    DivvyParentSObject parent =
        new DivvyParentSObject(Account.SObjectType);

    System.assertEquals(Account.SObjectType, parent.sObjectType);
    System.assertEquals('Account', parent.name);
    System.assertEquals(false, parent.isCustom);
  }
}