public class DivvyConfig {
  public static Map<DivvyAccessLevel, Type> Registrars =
      new Map<DivvyAccessLevel, Type>{
          DivvyAccessLevel.READ => DivvyRegistrar_Grant.class,
          DivvyAccessLevel.EDIT => DivvyRegistrar_Grant.class,
          DivvyAccessLevel.NONE => DivvyRegistrar_Revoke.class
      };
}