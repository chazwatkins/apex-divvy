public abstract class DivvyRegistrar implements IDivvyRegistrar {

    protected DivvyRegistry registry = new DivvyRegistry();

    public virtual void register(DivvyShareSObject sObjectToRegister) {
        Schema.SObjectType sObjType = sObjectToRegister.sObjectType;

        registry.register(sObjType, sObjectToRegister);
    }

    public virtual void registerDML(fflib_ISObjectUnitOfWork unitOfWork) {
        for(Schema.SObjectType sObjType : this.registry.sObjectTypes) {
            for(DivvyShareSObject dso : this.registry.getRegistrations(sObjType)) {
                unitOfWork.registerUpsert(dso.record);
            }
        }
    }
}