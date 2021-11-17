public class DivvyRegistrarFactory {
  private static Map<DivvyAccessLevel, Type> Registrars =
      new Map<DivvyAccessLevel, Type>{
          DivvyAccessLevel.READ => DivvyRegistrar_Grant.class,
          DivvyAccessLevel.EDIT => DivvyRegistrar_Grant.class,
          DivvyAccessLevel.NONE => DivvyRegistrar_Revoke.class
      };

  private Map<Type, IDivvyRegistrar> registrarInstances =
      new Map<Type, IDivvyRegistrar>();

  private IDivvyRegistrar mockRegistrar;

  public IDivvyRegistrar newInstance(DivvyAccessLevel accessLevel)
  {
    // Mock?
    if(mockRegistrar != null) {
      return this.mockRegistrar;
    }

    Type registrarType = Registrars.get(accessLevel);

    if(!registrarInstances.keySet().contains(registrarType)) {
      IDivvyRegistrar newRegistrar = (IDivvyRegistrar)registrarType.newInstance();
      registrarInstances.put(registrarType, newRegistrar);
    }

    return registrarInstances.get(registrarType);
  }

  public List<IDivvyRegistrar> getInstances() {
    return registrarInstances.values();
  }

  @TestVisible
  private void setMock(IDivvyRegistrar mockRegistrar)
  {
    this.mockRegistrar = mockRegistrar;
  }
}