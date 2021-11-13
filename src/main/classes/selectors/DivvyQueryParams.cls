public class DivvyQueryParams {
  public String shareSObjectName {get; private set;}
  public String parentIdFieldName {get; private set;}

  public Set<Id> parentIdSet = new Set<Id>();
  public Set<Id> userOrGroupIdSet = new Set<Id>();

  public DivvyQueryParams(List<DivvyShareSObject> shareSObjectList) {
    DivvyShareSObject shareSObject = shareSObjectList.get(0);
    this.shareSObjectName = shareSObject.name;
    this.parentIdFieldName = shareSObject.fields.parentIdFieldName;

    setParams(shareSObjectList);
  }

  public void setParams(List<DivvyShareSObject> shareSObjectList) {
    for(DivvyShareSObject shareSObject : shareSObjectList) {
      setParams(shareSObject);
    }
  }

  public void setParams(DivvyShareSObject shareSObject) {
    Id parentId =
        (Id)shareSObject.record.get(
            shareSObject.fields.parentIdFieldName
        );

    Id userOrGroupId =
        (Id)shareSObject.record.get(
            shareSObject.fields.userOrGroupFieldName
        );

    this.parentIdSet.add(parentId);
    this.userOrGroupIdSet.add(userOrGroupId);
  }

}