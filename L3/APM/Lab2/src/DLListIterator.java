public class DLListIterator {
	public int cursor = 0;
	public DoubleLinkedList l;

	DLListIterator(DoubleLinkedList list) {
		l = list;
	}

	public Object next() {
		return l.getAtIndex(cursor++);

	}

	public boolean hasNext() {
		return (cursor < l.size());

	}

	public Object prev() {
		return l.getAtIndex(--cursor);
	}

	public boolean hasPrev() {
		return cursor > 0;
	}

	public void reset() {
		cursor = 0;
	}

}
