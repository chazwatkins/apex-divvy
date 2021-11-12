public class DivvyRegistrar_Grant implements IDivvyRegistrar {
  public List<SObject> registrations = new List<SObject>();

  public void register(SObject sObjectToRegister) {
    this.registrations.add(sObjectToRegister);
  }

  public void registerDml(fflib_ISObjectUnitOfWork unitOfWork) {
    unitOfWork.registerUpsert(registrations);
  }
}
