package ex.sequence;

import java.util.*;

/**
 * Class representing a sequence of integer numbers.
 * 
 * @author Bea
 *
 */
public class MySequence {
	/** The elements of the sequence */
	private ArrayList<Integer> elem;

	/**
	 * Builds an empty <code>MySequence</code> object.
	 */
	public MySequence() {
		this.elem = new ArrayList<Integer>();
	}

	/**
	 * Builds a new  <code>MySequence</code> object .
	 * 
	 * @param a The list of integer numbers
	 */
	public  MySequence(ArrayList<Integer> a) {
		this.elem =new ArrayList<Integer>();
		this.elem=a;
	}
	
	/**
	 * Add a new element to the given position.
	 * 
	 * @param poz The position of the element
	 * @param e The integer object
	 */
	public void addElem(int poz, int e) {
		elem.add(poz, e);
	}

	/**
	 * Returns the integer number from the given position.
	 * 
	 * @param poz The position from the sequence
	 * @return An integer number from the given position
	 */
	public Integer getElemFromPoz(int poz) {
		if (poz <this.elem.size()) {
		return (Integer) elem.get(poz);
		}else{
			return null;
		}
	}

	/**
	 * Returns the size of the list.
	 * 
	 * @return The size of the list
	 */
	public int getDim() {
		return elem.size();
	}

	/**
	 * Sorts the list of integers.
	 */
	public void sort() {
		for (int i = 0; i < elem.size(); i++) {
			for (int j = i + 1; j < elem.size(); j++) {
				int e1 = (Integer) elem.get(j);
				int e2 = (Integer) elem.get(i);
				if (e1 < e2) {
					elem.set(i, e1);
					elem.set(j, e2);
				}
			}
		}
	}

	/**
	 * Returns the list of integers.
	 * 
	 * @return elem The list
	 */
	public ArrayList<Integer> getElem() {
		return elem;
	}
}