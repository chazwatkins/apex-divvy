public class DivvyRegistrar_Revoke extends DivvyRegistrar {

  public override void registerDML(fflib_ISObjectUnitOfWork unitOfWork) {
    for(Schema.SObjectType sObjType : registry.sObjectTypes) {

      IDivvyShareSObjectSelector selector =
          new DivvyShareSObjectSelector();

      List<DivvyShareSObject> registrations =
          registry.getRegistrations(sObjType);

      List<SObject> recordsToRevoke =
          selector.selectByParentIdAndUserOrGroupId(registrations);

      unitOfWork.registerDeleted(recordsToRevoke);
    }
  }
}
