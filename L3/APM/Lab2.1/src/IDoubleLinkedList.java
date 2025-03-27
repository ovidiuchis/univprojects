


public interface IDoubleLinkedList {
	public void add(Object e);
	public boolean contains(Object e);
	public Object getAtIndex(int index);
	public DLListIterator iterator();
	public void removeAtIndex(int index);
	public int size();
}
