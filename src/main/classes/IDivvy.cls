public interface IDivvy {
  void registerRead(Id recordId, Id userOrGroupId);

  void registerRead(Id recordId, Set<Id> userOrGroupIdSet);

  void registerRead(Set<Id> recordIdSet, Id userOrGroupId);

  void registerRead(Set<Id> recordIdSet, Set<Id> userOrGroupIdSet);

  void registerEdit(Id recordId, Id userOrGroupId);

  void registerEdit(Id recordId, Set<Id> userOrGroupIdSet);

  void registerEdit(Set<Id> recordIdSet, Id userOrGroupId);

  void registerEdit(Set<Id> recordIdSet, Set<Id> userOrGroupIdSet);

  void commitShares();
}
