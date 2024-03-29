@IsTest
private class DivvyShareSObjectSelectorTest {
  @IsTest
  static void selectByParentIdAndUserOrGroupIdTest() {
    Test.startTest();

    DivvyShareSObject shareSObject =
        DivvyTestDataFactory.createShareSObjectWithRecord();

    insert shareSObject.record;

    List<SObject> shareRecords =
        DivvyApplication.Selector.newInstance().selectByParentIdAndUserOrGroupId(
            new List<DivvyShareSObject>{shareSObject}
        );

    Test.stopTest();

    System.assertEquals(1, shareRecords.size());
  }
}