package ex.consprod;


/**
 * The consumer thread. Gets the number from the deposit.
 * 
 * @author Bea
 * 
 */
public class Consumer implements Runnable {
	
	/** The <code>Deposit</code> object */
	private Deposit deposit;

	/**
	 * Builds a new <code>Consumer</code> object.
	 * 
	 * @param d The <code>Deposit</code> object
	 */
	public Consumer(Deposit d) {
		deposit = d;
	}

	/**
	 * The run method.
	 */
	public void run() {
		String message = "";
		int value = 0;
		for (int i = 0; i < 5; i++) {
			value = deposit.get();
			message = " Consumer " + Thread.currentThread().getName() + " got:"
					+ value;
			System.out.println(message);
		}

	}

}
