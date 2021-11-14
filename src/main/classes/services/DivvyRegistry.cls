public class DivvyRegistry {
    private Map<Schema.SObjectType, List<DivvyShareSObject>> registrations =
            new Map<Schema.SObjectType, List<DivvyShareSObject>>();

    public Set<Schema.SObjectType> sObjectTypes {
        get { return this.registrations.keySet(); }
    }

    public List<DivvyShareSObject> getRegistrations(Schema.SObjectType sObjType) {
        return this.registrations.get(sObjType);
    }

    public void register(Schema.SObjectType sObjType, DivvyShareSObject shareSObject) {
        if(!this.registrations.keySet().contains(sObjType)) {
            this.registrations.put(sObjType, new List<DivvyShareSObject>());
        }

        this.registrations.get(sObjType).add(shareSObject);
    }
}