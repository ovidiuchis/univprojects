package ex.sequence;

import java.io.*;

/**
 * The test class.
 * 
 * @author Bea
 * 
 */
public class Test {
	/**
	 * The main method.
	 * 
	 * @param args
	 */
	public static void main(String args[]) {
		/* read the filename */
		String filename = new String();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					System.in));
			System.out.println("Give the filename with complete path:");
			filename = br.readLine();
		} catch (IOException ex) {
			ex.printStackTrace();
		}

		/* read the sequences from a file */
		Sequences s = new Sequences();
		try {
			s.readSequences(filename);
		} catch (FileNotFoundException e) {
			System.out.println(" The file was not found!");
		} catch (IOException e) {
			System.out.println("Error durring reading from file: ");
			e.printStackTrace();
		}
		if (s.getN() > 0) {
			s.sortSequences();

			/* print the sequences */
			System.out.println("The sequences are the following");
			s.displaySequences();

			/* read the interval */
			String intervalStr = new String();
			try {
				BufferedReader br = new BufferedReader(new InputStreamReader(
						System.in));
				System.out.println("Give the interval");
				intervalStr = br.readLine();
			} catch (IOException ex) {
				ex.printStackTrace();
			}

			/* validate the interval */
			Integer interval = null;
			try {
				interval = Integer.parseInt(intervalStr);
			} catch (NumberFormatException e) {
				System.out.println("Invalid inerval format !");
			}
			if (s.getN() < interval) {
				System.out.println("The number given is too big");
			} else {
				/* merge the sequences */
				s.merge(interval);

				/* display the result */
				s.displayResult();
			}
		}
	}
}