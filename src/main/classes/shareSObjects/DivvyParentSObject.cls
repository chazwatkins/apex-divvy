public class DivvyParentSObject {
  public Schema.SObjectType sObjectType;
  public String name;
  public Boolean isCustom;

  public DivvyParentSObject(Schema.SObjectType sObjectType) {
    DescribeSObjectResult describe = sObjectType.getDescribe();

    this.sObjectType = sObjectType;
    this.name = describe.getName();
    this.isCustom = describe.isCustom();
  }
}
