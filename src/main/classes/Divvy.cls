public with sharing class Divvy implements IDivvy {
  public DivvyUnitOfWork unitOfWork = new DivvyUnitOfWork();

  public void registerRead(Id recordId, Id userOrGroupId) {
    unitOfWork.register(recordId, userOrGroupId, DivvyAccessLevel.READ);
  }

  public void registerRead(Id recordId, Set<Id> userOrGroupIdSet) {
    unitOfWork.register(recordId, userOrGroupIdSet, DivvyAccessLevel.READ);
  }

  public void registerRead(Set<Id> recordIdSet, Id userOrGroupId) {
    unitOfWork.register(recordIdSet, userOrGroupId, DivvyAccessLevel.READ);
  }

  public void registerRead(Set<Id> recordIdSet, Set<Id> userOrGroupIdSet) {
    unitOfWork.register(recordIdSet, userOrGroupIdSet, DivvyAccessLevel.READ);
  }

  public void registerEdit(Id recordId, Id userOrGroupId) {
    unitOfWork.register(recordId, userOrGroupId, DivvyAccessLevel.EDIT);
  }

  public void registerEdit(Id recordId, Set<Id> userOrGroupIdSet) {
    unitOfWork.register(recordId, userOrGroupIdSet, DivvyAccessLevel.EDIT);
  }

  public void registerEdit(Set<Id> recordIdSet, Id userOrGroupId) {
    unitOfWork.register(recordIdSet, userOrGroupId, DivvyAccessLevel.EDIT);
  }

  public void registerEdit(Set<Id> recordIdSet, Set<Id> userOrGroupIdSet) {
    unitOfWork.register(recordIdSet, userOrGroupIdSet, DivvyAccessLevel.EDIT);
  }

  public void registerRevoke(Id recordId, Id userOrGroupId) {
    unitOfWork.register(recordId, userOrGroupId, DivvyAccessLevel.NONE);
  }

  public void commitShares() {
    try {
      unitOfWork.commitShares();
    } catch (DmlException e) {
      throw new DivvyException(e.getMessage());
    }
  }

  // TODO: Making better exceptions with exception chaining
  public class DivvyException extends Exception { }
}
