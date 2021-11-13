public interface IDivvyShareSObjectSelector {
  List<SObject> selectByParentIdAndUserOrGroupId(
      List<DivvyShareSObject> shareSObjects
  );
}
