@IsTest
private class DivvyRegistrar_RevokeTest {
  @IsTest
  static void registerDMLTest() {

    List<DivvyShareSObject> shareSObjects =
        DivvyTestDataFactory.createMockShareSObjects(1);

    DivvyShareSObject shareSObject = shareSObjects[0];

    List<SObject> shareRecords = new List<SObject>();
    for(DivvyShareSObject so : shareSObjects) {
      shareRecords.add(so.record);
    }

    fflib_ApexMocks mocks = new fflib_ApexMocks();

    DivvyShareSObjectSelector mockSelector =
        (DivvyShareSObjectSelector) mocks.mock(DivvyShareSObjectSelector.class);

    fflib_ISObjectUnitOfWork mockUOW =
        (fflib_ISObjectUnitOfWork) mocks.mock(fflib_SObjectUnitOfWork.class);

    mocks.startStubbing();

    mocks
    .when(mockSelector.selectByParentIdAndUserOrGroupId(shareSObjects))
    .thenReturn(shareRecords);

    mocks.stopStubbing();

    DivvyApplication.Selector.setMock(mockSelector);
    DivvyApplication.UnitOfWork.setMock(mockUOW);

    DivvyRegistrar_Revoke registrar = new DivvyRegistrar_Revoke();
    registrar.register(shareSObject);
    registrar.registerDML(mockUOW);

    ((IDivvyShareSObjectSelector)mocks.verify(mockSelector)).selectByParentIdAndUserOrGroupId(shareSObjects);
    ((fflib_ISObjectUnitOfWork)mocks.verify(mockUOW)).registerDeleted(shareRecords);

  }
}