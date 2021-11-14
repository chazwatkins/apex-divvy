public with sharing class Divvy implements IDivvy {

  public void registerRead(Id recordId, Id userOrGroupId) {
    DivvyRegistrationService.register(
        recordId,
        userOrGroupId,
        DivvyAccessLevel.READ
    );
  }

  public void registerRead(Id recordId, Set<Id> userOrGroupIdSet) {
    DivvyRegistrationService.register(
        recordId,
        userOrGroupIdSet,
        DivvyAccessLevel.READ
    );
  }

  public void registerRead(Set<Id> recordIdSet, Id userOrGroupId) {
    DivvyRegistrationService.register(
        recordIdSet, userOrGroupId,
        DivvyAccessLevel.READ
    );
  }

  public void registerRead(Set<Id> recordIdSet, Set<Id> userOrGroupIdSet) {
    DivvyRegistrationService.register(
        recordIdSet, userOrGroupIdSet,
        DivvyAccessLevel.READ
    );
  }

  public void registerEdit(Id recordId, Id userOrGroupId) {
    DivvyRegistrationService.register(
        recordId, userOrGroupId,
        DivvyAccessLevel.EDIT
    );
  }

  public void registerEdit(Id recordId, Set<Id> userOrGroupIdSet) {
    DivvyRegistrationService.register(
        recordId, userOrGroupIdSet,
        DivvyAccessLevel.EDIT
    );
  }

  public void registerEdit(Set<Id> recordIdSet, Id userOrGroupId) {
    DivvyRegistrationService.register(
        recordIdSet, userOrGroupId,
        DivvyAccessLevel.EDIT
    );
  }

  public void registerEdit(Set<Id> recordIdSet, Set<Id> userOrGroupIdSet) {
    DivvyRegistrationService.register(
        recordIdSet,
        userOrGroupIdSet,
        DivvyAccessLevel.EDIT
    );
  }

  public void registerRevoke(Id recordId, Id userOrGroupId) {
    DivvyRegistrationService.register(
        recordId, userOrGroupId,
        DivvyAccessLevel.NONE
    );
  }

  public void commitShares() {
      DivvyRegistrationService.commitShares();
  }

  // TODO: Making better exceptions with exception chaining
  public class DivvyException extends Exception { }
}
