public class DLListIterator {
	public int cursor = -1;
	public DoubleLinkedList l;

	DLListIterator(DoubleLinkedList list) {
		l = list;
	}

	public Object next() {
		return l.getAtIndex(++cursor);

	}

	public boolean hasNext() {
		return cursor < l.size();

	}

	public Object prev() {
		if (cursor > 0)
			return l.getAtIndex(--cursor);
		return 0;
	}

	public boolean hasPrev() {
		return cursor > 0;
	}
	public void reset(){
		cursor=-1;
	}

}
