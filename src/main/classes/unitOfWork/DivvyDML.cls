public virtual class DivvyDML implements fflib_SObjectUnitOfWork.IDML {
  public virtual void dmlInsert(List<SObject> objList) {
    Database.insert(objList, false);
  }

  public virtual void dmlUpdate(List<SObject> objList) {
    Database.update(objList, false);
  }

  public virtual void dmlDelete(List<SObject> objList) {
    Database.delete(objList, false);
  }

  public virtual void eventPublish(List<SObject> objList) {
    EventBus.publish(objList);
  }

  public virtual void emptyRecycleBin(List<SObject> objList) {
    if (objList.isEmpty()) {
      return;
    }

    Database.emptyRecycleBin(objList);
  }
}
