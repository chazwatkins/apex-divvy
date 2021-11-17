public abstract class DivvyRegistrar implements IDivvyRegistrar {

    protected DivvyRegistry registry = new DivvyRegistry();

    public virtual void register(DivvyShareSObject sObjectToRegister) {
        Schema.SObjectType sObjType = sObjectToRegister.sObjectType;

        registry.register(sObjType, sObjectToRegister);
    }

    public abstract void registerDML(fflib_ISObjectUnitOfWork unitOfWork);
}