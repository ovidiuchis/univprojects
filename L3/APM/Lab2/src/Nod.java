public class Nod {
	private Nod next;
	private Nod prev;
	private Object info;

	public Nod() {
		next = prev = null;
	}

	public Nod(Nod n, Nod p, Object o) {
		next = n;
		prev = p;
		info = o;
	}

	public void setNext(Nod n) {
		next = n;
	}

	public void setPrev(Nod p) {
		prev = p;
	}

	public void setInfo(Object o) {
		info = o;
	}

	public Object getInfo() {
		return info;
	}

	public Nod getNext() {
		return next;
	}

	public Nod getPrev() {
		return prev;
	}
	/*
	 * public static void main(String args[]){ Object o="bla"; Nod p=new
	 * Nod(null,null,o); Nod d=new Nod(p,null,o);
	 * System.out.print(p.getInfo().toString()); p.setNext(d);
	 * System.out.print(p.getNext().getInfo().toString());
	 * 
	 * }
	 */
}
