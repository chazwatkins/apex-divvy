public with sharing class Divvy implements IDivvy {

  private IDivvyRegistrationService service =
      (IDivvyRegistrationService)new DivvyRegistrationService();

  public void registerRead(Id recordId, Id userOrGroupId) {
    service.register(
        recordId,
        userOrGroupId,
        DivvyAccessLevel.READ
    );
  }

  public void registerRead(Id recordId, Set<Id> userOrGroupIdSet) {
    service.register(
        recordId,
        userOrGroupIdSet,
        DivvyAccessLevel.READ
    );
  }

  public void registerRead(Set<Id> recordIdSet, Id userOrGroupId) {
    service.register(
        recordIdSet, userOrGroupId,
        DivvyAccessLevel.READ
    );
  }

  public void registerRead(Set<Id> recordIdSet, Set<Id> userOrGroupIdSet) {
    service.register(
        recordIdSet, userOrGroupIdSet,
        DivvyAccessLevel.READ
    );
  }

  public void registerEdit(Id recordId, Id userOrGroupId) {
    service.register(
        recordId, userOrGroupId,
        DivvyAccessLevel.EDIT
    );
  }

  public void registerEdit(Id recordId, Set<Id> userOrGroupIdSet) {
    service.register(
        recordId, userOrGroupIdSet,
        DivvyAccessLevel.EDIT
    );
  }

  public void registerEdit(Set<Id> recordIdSet, Id userOrGroupId) {
    service.register(
        recordIdSet, userOrGroupId,
        DivvyAccessLevel.EDIT
    );
  }

  public void registerEdit(Set<Id> recordIdSet, Set<Id> userOrGroupIdSet) {
    service.register(
        recordIdSet,
        userOrGroupIdSet,
        DivvyAccessLevel.EDIT
    );
  }

  public void registerRevoke(Id recordId, Id userOrGroupId) {
    service.register(
        recordId, userOrGroupId,
        DivvyAccessLevel.NONE
    );
  }

  public void commitShares() {
    service.commitShares();
  }

  // TODO: Making better exceptions with exception chaining
  public class DivvyException extends Exception { }
}
