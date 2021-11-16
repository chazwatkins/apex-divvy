public class DivvyRegistrationService implements IDivvyRegistrationService {

  public static Map<DivvyAccessLevel, Type> Registrars =
      new Map<DivvyAccessLevel, Type>{
          DivvyAccessLevel.READ => DivvyRegistrar_Grant.class,
          DivvyAccessLevel.EDIT => DivvyRegistrar_Grant.class,
          DivvyAccessLevel.NONE => DivvyRegistrar_Revoke.class
      };

  private Map<Type, IDivvyRegistrar> registrarInstances =
      new Map<Type, IDivvyRegistrar>();

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
    IDivvyDMLUnitOfWork unitOfWork = new DivvyDMLUnitOfWork(
        new List<Schema.SObjectType>(dmlSObjectTypes)
    );

    for(IDivvyRegistrar registrar : registrarInstances.values()) {
      registrar.registerDML(unitOfWork);
    }

    unitOfWork.commitWork();
  }

  private void register(DivvyShareSObject shareSObject) {
    registrar(shareSObject.accessLevel).register(shareSObject);
    dmlSObjectTypes.add(shareSObject.sObjectType);
  }

  private IDivvyRegistrar registrar(DivvyAccessLevel accessLevel){
    Type registrarType = Registrars.get(accessLevel);

    if(!registrarInstances.keySet().contains(registrarType)) {
      IDivvyRegistrar newRegistrar = (IDivvyRegistrar)registrarType.newInstance();
      registrarInstances.put(registrarType, newRegistrar);
    }

    return registrarInstances.get(registrarType);
  }
}