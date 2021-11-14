public interface IDivvyRegistrar {
  void register(DivvyShareSObject record);
  void registerDML(fflib_ISObjectUnitOfWork dmlUnitOfWork);
}
