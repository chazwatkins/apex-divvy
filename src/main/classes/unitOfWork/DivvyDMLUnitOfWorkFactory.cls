public virtual class DivvyDMLUnitOfWorkFactory {
  private fflib_ISObjectUnitOfWork mockUnitOfWork;

  public fflib_ISObjectUnitOfWork newInstance(List<SObjectType> objectTypes)
  {
    // Mock?
    if(mockUnitOfWork != null) {
      return this.mockUnitOfWork;
    }

    return (fflib_ISObjectUnitOfWork)new fflib_SObjectUnitOfWork(
        objectTypes,
        new DivvyDML()
    );
  }

  @TestVisible
  private void setMock(fflib_ISObjectUnitOfWork mockUnitOfWork)
  {
    this.mockUnitOfWork = mockUnitOfWork;
  }

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
}