package ex.sequence;

import java.util.*;

/**
 * Thread class which sorts the sequence of integer numbers.
 * 
 * @author Bea
 */
public class MyThread extends Thread {
	/** The sequences */
	private Sequences s;

	/** The position */
	private int poz;

	/**
	 * Builds an empty <code>MyThread</code> object.
	 * 
	 */
	public MyThread() {
	}

	/**
	 * Builds a new <code>MyThread</code> object based on the given arguments.
	 * 
	 * @param s The <code>Sequences</code> object
	 * @param poz The position
	 */
	public MyThread(Sequences s, int poz) {
		this.s = s;
		this.poz = poz;
	}

	/**
	 * The run method.
	 */
	public void run() {
		ArrayList<Integer> result = new ArrayList<Integer>();
		ArrayList<Integer> s1 = s.getSequence(0);
		ArrayList<Integer> s2 = s.getSequence(poz);
		int i = 0;
		int j = 0;
		while ((i < s1.size()) && (j < s2.size())) {
			int e1 = (Integer) s1.get(i);
			int e2 = (Integer) s2.get(j);
			if (e1 < e2) {
				result.add(e1);
				i++;
			} else {
				result.add(e2);
				j++;
			}
		}
		if (i < s1.size()) {
			while (i < s1.size()) {
				int e = (Integer) s1.get(i);
				result.add(e);
				i++;
			}
		}
		if (j < s2.size()) {
			while (j < s2.size()) {
				int e = (Integer) s2.get(j);
				result.add(e);
				j++;
			}
		}
		s.setSequence(result, 0);
	}

}
