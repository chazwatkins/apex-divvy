public class DivvyRegistrationService implements IDivvyRegistrationService {

  private Set<Schema.SObjectType> dmlSObjectTypes = new Set<Schema.SObjectType>();

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

    register(shareSObject);
  }

  // TODO: Add Error Handling for Shares that weren't successful
  public void commitShares() {
    fflib_ISObjectUnitOfWork unitOfWork =
        DivvyApplication.UnitOfWork.newInstance(
            new List<Schema.SObjectType>(dmlSObjectTypes)
        );

    for(IDivvyRegistrar registrar : DivvyApplication.Registrar.getInstances()) {
      registrar.registerDML(unitOfWork);
    }

    unitOfWork.commitWork();
  }

  private void register(DivvyShareSObject shareSObject) {
    registrar(shareSObject.accessLevel).register(shareSObject);
    dmlSObjectTypes.add(shareSObject.sObjectType);
  }

  private IDivvyRegistrar registrar(DivvyAccessLevel accessLevel){
    return DivvyApplication.Registrar.newInstance(accessLevel);
  }
}