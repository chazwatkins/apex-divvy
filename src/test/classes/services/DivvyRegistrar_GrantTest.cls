@IsTest
private class DivvyRegistrar_GrantTest {
  @IsTest
  static void registerDMLTest() {

    fflib_ApexMocks mocks = new fflib_ApexMocks();

    fflib_ISObjectUnitOfWork mockUOW =
        (fflib_ISObjectUnitOfWork) mocks.mock(fflib_SObjectUnitOfWork.class);

    DivvyApplication.UnitOfWork.setMock(mockUOW);

    List<DivvyShareSObject> shareSObjects =
        DivvyTestDataFactory.createMockShareSObjects(1);

    DivvyShareSObject shareSObject = shareSObjects[0];

    DivvyRegistrar_Grant registrar = new DivvyRegistrar_Grant();
    registrar.register(shareSObject);

    registrar.registerDML(mockUOW);

    ((fflib_ISObjectUnitOfWork)mocks.verify(mockUOW)).registerUpsert(shareSObject.record);

  }
}