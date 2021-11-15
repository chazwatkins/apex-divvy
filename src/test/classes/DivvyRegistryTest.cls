@IsTest
private class DivvyRegistryTest {
  @IsTest
  static void registerTest() {
    DivvyRegistry registry = new DivvyRegistry();

    Schema.SObjectType sObjType = Account.SObjectType;

    List<DivvyShareSObject> shareSObjects =
        DivvyTestDataFactory.createMockShareSObjects(1);

    DivvyShareSObject shareSObject = shareSObjects[0];
    registry.register(shareSObject.sObjectType, shareSObject);

    System.assert(
        registry.sObjectTypes.contains(shareSObject.sObjectType)
    );

    System.assertEquals(
        1,
        registry.getRegistrations(shareSObject.sObjectType).size()
    );
  }
}