public with sharing class DivvyShareSObjectSelector implements IDivvyShareSObjectSelector {

  public List<SObject> selectByParentIdAndUserOrGroupId(
      List<DivvyShareSObject> shareSObjectList
  ) {

    DivvyQueryParams queryParams = buildQueryParams(shareSObjectList);

    Set<Id> parentIdSet = queryParams.parentIdSet;
    Set<Id> userOrGroupIdSet = queryParams.userOrGroupIdSet;

    String query = String.format(
      'SELECT Id ' +
      'FROM {0} ' +
      'WHERE {1} IN :parentIdSet ' +
      'AND UserOrGroupId IN :userOrGroupIdSet',
      new List<Object>{
        queryParams.shareSObjectName,
        queryParams.parentIdFieldName
      }
    );

    String escapedQuery = String.escapeSingleQuotes(query);

    return Database.query(escapedQuery);
  }

  private DivvyQueryParams buildQueryParams(
      List<DivvyShareSObject> shareSObjectList
  ) {
    return new DivvyQueryParams(shareSObjectList);
  }
}
