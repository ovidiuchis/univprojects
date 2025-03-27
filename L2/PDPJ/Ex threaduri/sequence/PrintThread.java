package ex.sequence;

import java.util.*;

/**
 * Thread class used for printing the elements from the given sequences.
 * 
 * @author Bea
 * 
 */
public class PrintThread extends Thread {
	/** The <code>Sequences</code> object */
	private Sequences s;

	/**
	 * Builds an empty <code>PrintThread</code> object.
	 * 
	 */
	public PrintThread() {
	}

	/**
	 * Builds a new <code>PrintThread</code> based on the given arguments.
	 * 
	 * @param s The <code>Sequences</code> object
	 */
	public PrintThread(Sequences s)

	{
		this.s = s;
	}

	/**
	 * Prints the elements from the sequences.
	 */
	public void run() {
		System.out
				.println("-------------------------------------------------------");
		System.out.println("Intermediary result");
		for (int i = 0; i < s.getN(); i++) {
			ArrayList<Integer> seq = s.getSequence(i);
			for (int j = 0; j < seq.size(); j++) {
				System.out.print(seq.get(j) + "  ");
			}
			System.out.println();
			System.out
					.println("----------------------------------------------------");
		}
	}
}