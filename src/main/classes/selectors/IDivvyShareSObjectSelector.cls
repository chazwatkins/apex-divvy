public interface IDivvyShareSObjectSelector {
  List<SObject> selectByParentIdAndUserOrGroupId(
    Set<Id> parentIdSet,
    Set<Id> userOrGroupIdSet
  );
}
