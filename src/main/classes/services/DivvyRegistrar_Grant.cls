public class DivvyRegistrar_Grant
  extends DivvyRegistrar
{

  public override void registerDML(fflib_ISObjectUnitOfWork unitOfWork) {
    for(Schema.SObjectType sObjType : this.registry.sObjectTypes) {

      List<DivvyShareSObject> registrations =
          this.registry.getRegistrations(sObjType);

      for(DivvyShareSObject shareSObject : registrations) {
        unitOfWork.registerUpsert(shareSObject.record);
      }

    }
  }
}
