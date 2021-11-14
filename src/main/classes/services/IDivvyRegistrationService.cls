public interface IDivvyRegistrationService {
  void register(
      Id recordId,
      Id userOrGroupId,
      DivvyAccessLevel accessLevel
  );

  void register(
    Id recordId,
    Set<Id> userOrGroupIdSet,
    DivvyAccessLevel accessLevel
  );

  void register(
    Set<Id> recordIdSet,
    Id userOrGroupId,
    DivvyAccessLevel accessLevel
  );

  void register(
    Set<Id> recordIdSet,
    Set<Id> userOrGroupIdSet,
    DivvyAccessLevel accessLevel
  );

  void commitShares();
}
