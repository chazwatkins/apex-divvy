public with sharing class DivvyShareSObjectSelector {
  protected DivvyShareSObject shareSObject;

  public DivvyShareSObjectSelector(DivvyShareSObject shareSObject) {
    this.shareSObject = shareSObject;
  }

  public List<SObject> selectByParentIdAndUserOrGroupId(
    Set<Id> parentIdSet,
    Set<Id> userOrGroupIdSet
  ) {
    String query = String.format(
      'SELECT Id ' +
      'FROM {0} ' +
      'WHERE {1} IN :parentIdSet ' +
      'AND UserOrGroupId IN :userOrGroupIdSet',
      new List<Object>{
        this.shareSObject.name,
        this.shareSObject.fields.parentIdFieldName
      }
    );

    String escapedQuery = String.escapeSingleQuotes(query);

    return Database.query(escapedQuery);
  }
}
