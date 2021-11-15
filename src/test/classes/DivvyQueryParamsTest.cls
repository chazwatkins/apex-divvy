@IsTest
private class DivvyQueryParamsTest {
  @IsTest
  static void shareSObjectNameIsSetCorrectly() {
    Integer shareSObjectsToCreate = 100;
    List<DivvyShareSObject> shareSObjectList =
        DivvyTestDataFactory.createMockShareSObjects(shareSObjectsToCreate);

    DivvyQueryParams queryParams =
        new DivvyQueryParams(shareSObjectList);

    System.assertEquals('AccountShare', queryParams.shareSObjectName);
  }

  @IsTest
  static void parentIdFieldNameIsSetCorrectly() {
    Integer shareSObjectsToCreate = 100;
    List<DivvyShareSObject> shareSObjectList =
        DivvyTestDataFactory.createMockShareSObjects(shareSObjectsToCreate);

    DivvyQueryParams queryParams =
        new DivvyQueryParams(shareSObjectList);

    System.assertEquals('AccountId', queryParams.parentIdFieldName);
  }

  @IsTest
  static void parentIdSetsAreCorrect() {
    Integer shareSObjectsToCreate = 100;
    List<DivvyShareSObject> shareSObjectList =
        DivvyTestDataFactory.createMockShareSObjects(shareSObjectsToCreate);

    DivvyQueryParams queryParams =
        new DivvyQueryParams(shareSObjectList);

    System.assertEquals(shareSObjectsToCreate, queryParams.parentIdSet.size());
  }

  @IsTest
  static void userOrGroupIdSetsAreCorrect() {
    Integer shareSObjectsToCreate = 100;
    List<DivvyShareSObject> shareSObjectList =
        DivvyTestDataFactory.createMockShareSObjects(shareSObjectsToCreate);

    DivvyQueryParams queryParams =
        new DivvyQueryParams(shareSObjectList);

    System.assertEquals(shareSObjectsToCreate, queryParams.userOrGroupIdSet.size());
  }


}