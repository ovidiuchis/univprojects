package ex.consprod;

/**
 * The producer thread. Puts new content values to the deposit.
 * 
 * @author Bea
 */
public class Producer implements Runnable {

	/** The deposit */
	private Deposit deposit;

	/**
	 * Builds a new <code>Producer</code> object.
	 * 
	 * @param d
	 *            The <code>Deposit</code> object
	 */
	public Producer(Deposit d) {
		deposit = d;

	}

	/**
	 * The run method.
	 */
	public void run() {
		String message = "";
		for (int i = 0; i < 5; i++) {
			deposit.put(i);
			message = "Producer " + Thread.currentThread().getName() + " put: "
					+ i;
			System.out.println(message);
			try {
				Thread.sleep((int) (Math.random() * 100));
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

}
