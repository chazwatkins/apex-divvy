public class DivvyUnitOfWork implements IDivvyUnitOfWork {
  public fflib_ISObjectUnitOfWork dmlUnitOfWork;

  protected Set<Schema.SObjectType> dmlSObjectTypes = new Set<Schema.SObjectType>();

  protected IDivvyRegistrar grantRegistrar = new DivvyRegistrar_Grant();
  protected IDivvyRegistrar revokeRegistrar = new DivvyRegistrar_Revoke();

  private List<IDivvyRegistrar> availableRegistrars = new List<IDivvyRegistrar>{
      grantRegistrar,
      revokeRegistrar
  };

  protected Map<DivvyAccessLevel, IDivvyRegistrar> registrars = new Map<DivvyAccessLevel, IDivvyRegistrar>{
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
    DivvyShareSObject shareSObject =
          DivvyShareSObjectFactory.newInstance(
            recordId,
            userOrGroupId,
            accessLevel
          );

    IDivvyRegistrar registrar = registrars.get(accessLevel);

    registrar.register(shareSObject);

    this.dmlSObjectTypes.add(shareSObject.sObjectType);
  }

  public void commitShares() {
    createDMLUnitOfWork();
    doDMLRegistrations();
    this.dmlUnitOfWork.commitWork();
  }

  private void doDMLRegistrations() {
    for(IDivvyRegistrar registrar : availableRegistrars) {
      registrar.registerDML(this.dmlUnitOfWork);
    }
  }

  private void createDMLUnitOfWork() {
    this.dmlUnitOfWork = new fflib_SObjectUnitOfWork(
      new List<Schema.SObjectType>(this.dmlSObjectTypes),
      new DivvyDML()
    );
  }
}
