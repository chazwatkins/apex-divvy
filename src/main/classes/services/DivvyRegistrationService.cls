public class DivvyRegistrationService {
  private static Map<Type, IDivvyRegistrar> registrarInstances =
      new Map<Type, IDivvyRegistrar>();

  private static Set<Schema.SObjectType> dmlSObjectTypes = new Set<Schema.SObjectType>();

  public static void register(
      Set<Id> recordIdSet,
      Set<Id> userOrGroupIdSet,
      DivvyAccessLevel accessLevel
  ) {
    for (Id recordId : recordIdSet) {
      register(recordId, userOrGroupIdSet, accessLevel);
    }
  }

  public static void register(
      Set<Id> recordIdSet,
      Id userOrGroupId,
      DivvyAccessLevel accessLevel
  ) {
    for (Id recordId : recordIdSet) {
      register(recordId, userOrGroupId, accessLevel);
    }
  }

  public static void register(
      Id recordId,
      Set<Id> userOrGroupIdSet,
      DivvyAccessLevel accessLevel
  ) {
    for (Id userOrGroupId : userOrGroupIdSet) {
      register(recordId, userOrGroupId, accessLevel);
    }
  }

  public static void register(
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

  public static void commitShares() {
    IDivvyDMLUnitOfWork unitOfWork = new DivvyDMLUnitOfWork(
        new List<Schema.SObjectType>(dmlSObjectTypes)
    );

    for(IDivvyRegistrar registrar : registrarInstances.values()) {
      registrar.registerDML(unitOfWork);
    }

    unitOfWork.commitWork();
  }

  private static void register(DivvyShareSObject shareSObject) {
    registrar(shareSObject.accessLevel).register(shareSObject);
    dmlSObjectTypes.add(shareSObject.sObjectType);
  }
  private static IDivvyRegistrar registrar(DivvyAccessLevel accessLevel){
    Type registrarType = DivvyConfig.Registrars.get(accessLevel);

    if(!registrarInstances.keySet().contains(registrarType)) {
      IDivvyRegistrar newRegistrar = (IDivvyRegistrar)registrarType.newInstance();
      registrarInstances.put(registrarType, newRegistrar);
    }

    return registrarInstances.get(registrarType);
  }
}