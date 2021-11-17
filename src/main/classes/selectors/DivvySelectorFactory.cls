public class DivvySelectorFactory {
  private IDivvyShareSObjectSelector mockSelector;

  public IDivvyShareSObjectSelector newInstance()
  {
    // Mock?
    if(mockSelector != null) {
      return this.mockSelector;
    }

    return (IDivvyShareSObjectSelector)new DivvyShareSObjectSelector();
  }

  @TestVisible
  private void setMock(IDivvyShareSObjectSelector mockSelector)
  {
    this.mockSelector = mockSelector;
  }
}