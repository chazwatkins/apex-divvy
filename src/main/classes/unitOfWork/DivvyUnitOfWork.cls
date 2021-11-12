public class DivvyUnitOfWork implements IDivvyUnitOfWork {
  protected fflib_ISObjectUnitOfWork dmlUnitOfWork;

  protected DivvyShareSObjectFactory shareSObjectFactory = new DivvyShareSObjectFactory();

  protected Set<Schema.SObjectType> sObjectTypes = new Set<Schema.SObjectType>();

  protected IDivvyRegistrar grantRegistrar = new DivvyRegistrar_Grant();
  protected IDivvyRegistrar revokeRegistrar = new DivvyRegistrar_Revoke();

  protected Map<DivvyAccessLevel, IDivvyRegistrar> registrar = new Map<DivvyAccessLevel, IDivvyRegistrar>{
    DivvyAccessLevel.READ => grantRegistrar,
    DivvyAccessLevel.EDIT => grantRegistrar,
    DivvyAccessLevel.NONE => revokeRegistrar
  };

  public void register(
    Set<Id> recordIdSet,
    Set<Id> userOrGroupIdSet,
    DivvyAccessLevel accessLevel
  ) {
    for (Id recordId : recordIdSet) {
      register(recordId, userOrGroupIdSet, accessLevel);
    }
  }

  public void register(
          Set<Id> recordIdSet,
          Id userOrGroupId,
          DivvyAccessLevel accessLevel
  ) {
    for (Id recordId : recordIdSet) {
      register(recordId, userOrGroupId, accessLevel);
    }
  }

  public void register(
          Id recordId,
          Set<Id> userOrGroupIdSet,
          DivvyAccessLevel accessLevel
  ) {
    for (Id userOrGroupId : userOrGroupIdSet) {
      register(recordId, userOrGroupId, accessLevel);
    }
  }

  public void register(
          Id recordId,
          Id userOrGroupId,
          DivvyAccessLevel accessLevel
  ) {
    SObject shareSObject = shareSObjectFactory.newInstance(
            recordId,
            userOrGroupId,
            accessLevel
    );

    registrar.get(accessLevel).register(shareSObject);

    this.sObjectTypes.add(shareSObject.getSObjectType());
  }

  public void commitShares() {
    createDMLUnitOfWork();
    //    doDMLRegistrations();
    //    this.dmlUnitOfWork.commitWork();
  }

  private void createDMLUnitOfWork() {
    this.dmlUnitOfWork = new fflib_SObjectUnitOfWork(
      new List<Schema.SObjectType>(sObjectTypes),
      new DivvyDML()
    );
  }
}
