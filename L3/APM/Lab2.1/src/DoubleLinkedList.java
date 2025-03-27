public class DoubleLinkedList implements IDoubleLinkedList {
	public Nod head;
	public int size = 0;

	public DoubleLinkedList() {
		head = null;
	}

	public void add(Object o) {
		if (head == null) {
			head = new Nod(null, null, o);
			size = size + 1;
		} else {
			Nod p = new Nod(null, null, o);
			Nod cursor = head;
			boolean ok = true;
			while (ok) {
				if (cursor.getNext() != null)
					cursor = cursor.getNext();
				else
					ok = false;
			}
			cursor.setNext(p);
			p.setPrev(cursor);
			size = size + 1;
		}

	}

	public int size() {
		return size;
	}

	public Object getAtIndex(int index) {
		if (index < size) {
			int p = 0;
			Nod cursor = head;
			while (p < index) {
				cursor = cursor.getNext();
				p = p + 1;
			}
			return cursor.getInfo();
		}
		return 0;
	}

	public boolean contains(Object o) {
		Nod cursor = head;
		while (cursor != null) {
			if (cursor.getInfo().equals(o))
				return true;
			cursor = cursor.getNext();
		}
		return false;
	}

	public void removeAtIndex(int index) {
		if (index == 0) {
			head = head.getNext();
			size--;
		} else if (index == size - 1)
			size--;
		else {
			Nod curs = head;
			int i = 0;
			while (i != index) {
				curs = curs.getNext();
				i++;
			}
			curs.getNext().setPrev(curs.getPrev());
			curs.getPrev().setNext(curs.getNext());
		}

	}

	public DLListIterator iterator() {
		return new DLListIterator(this);
	}

}
