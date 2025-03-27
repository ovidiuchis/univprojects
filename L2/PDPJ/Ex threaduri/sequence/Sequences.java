package ex.sequence;

import java.util.*;
import java.io.*;

/**
 * Helper class, used for keeping the sequences.
 * 
 * @author Bea
 * 
 */
public class Sequences {

	/** The array of <code>MySequence</code> object */
	private MySequence[] seq;

	/** The number of sequences */
	private int n;

	/**
	 * Builds an empty <code>Sequences</code> object.
	 */
	public Sequences() {
		this.seq = null;
		this.n = 0;
	}

	/**
	 * Add a new sequence to the given position.
	 * 
	 * @param list
	 *            A list of integer numbers.
	 * @param poz
	 *            The position where the list will be inserted
	 */
	public void addElems(ArrayList<Integer> list, int poz) {
		this.seq[poz] = new MySequence(list);
	}

	/**
	 * Reads the sequences from the given file.
	 * 
	 * @param file
	 *            The name of the file
	 * @throws IOException
	 */
	public void readSequences(String file) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader(file));
		String line;
		n = Integer.parseInt(br.readLine());
		seq = new MySequence[n];
		int k = 0;
		while ((line = br.readLine()) != null) {
			String[] data = line.split(" ");
			ArrayList<Integer> a = new ArrayList<Integer>();
			for (int i = 0; i < data.length; i++)
				a.add(i, Integer.parseInt(data[i]));
			addElems(a, k);
			k++;
		}
		br.close();

	}

	/**
	 * Displays the sequences.
	 */
	public void displaySequences() {
		System.out.println("The number of sequences is =" + n);
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < seq[i].getDim(); j++) {
				System.out.print(seq[i].getElemFromPoz(j) + "  ");
			}
			System.out.println();
			System.out
					.println("----------------------------------------------------");
		}
	}

	/**
	 * Sorts the sequences.
	 */
	public void sortSequences() {
		for (int i = 0; i < n; i++) {
			seq[i].sort();
		}
	}

	/**
	 * Returns the sequence from the given position.
	 * 
	 * @param poz
	 *            The position
	 * @return A list of integer numbers
	 */
	public ArrayList<Integer> getSequence(int poz) {
		if (poz < n) {
			return seq[poz].getElem();
		} else {
			return null;
		}
	}

	/**
	 * Add a new sequence to the array of sequences.
	 * 
	 * @param list
	 *            The list containing integer numbers
	 * @param poz
	 *            The position
	 */
	public void setSequence(ArrayList<Integer> list, int poz) {
		seq[poz] = new MySequence(list);
	}

	/**
	 * Merges the sequences based on the given interval
	 * 
	 * @param interval
	 *            The interval
	 */
	public void merge(int interval) {
		Thread[] threads = new Thread[n + n];
		int nrthread = 0;

		for (int i = 1; i < n; i++) {
			MyThread mythread = new MyThread(this, i);
			mythread.start();
			threads[nrthread++] = mythread;
			if ((interval == i) || (i % interval == 0)) {
				PrintThread t = new PrintThread(this);
				t.start();
				threads[nrthread++] = t;
			}

		}

		for (int i = 0; i < nrthread; i++) {
			try {
				threads[i].join();
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}
	}

	/**
	 * Displays the result.
	 */
	public void displayResult() {
		System.out.println("The final  result is ");
		ArrayList<Integer> result = seq[0].getElem();
		for (int i = 0; i < result.size(); i++)
			System.out.print(result.get(i) + "  ");
		System.out.println();
	}

	/**
	 * Return the number of sequences
	 * 
	 * @return number of sequences
	 */
	public int getN() {
		return n;
	}
}