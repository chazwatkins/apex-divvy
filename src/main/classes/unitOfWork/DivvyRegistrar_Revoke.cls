public class DivvyRegistrar_Revoke implements IDivvyRegistrar {
  private Map<Schema.SObjectType, List<SObject>> registrations = new Map<Schema.SObjectType, List<SObject>>();

  public void register(SObject sObjectToRegister) {
    Schema.SObjectType sObjectType = sObjectToRegister.getSObjectType();

    if (!isSObjectTypeInRevokeMap(sObjectType)) {
      this.registrations.put(sObjectType, new List<SObject>());
    }

    this.registrations.get(sObjectType).add(sObjectToRegister);
  }

  // TODO: Register DMLs
  public void registerDml(fflib_ISObjectUnitOfWork unitOfWork) {
    // For Each SObjectType, query for any Share records with
    // ParentId and userOrObjectId
    // register.deleted for each returned record
  }

  private Boolean isSObjectTypeInRevokeMap(Schema.SObjectType sObjectType) {
    return this.registrations.keySet().contains(sObjectType);
  }
}
