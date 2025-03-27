package ex.bank;


/**
 * The tread for the bank.
 * 
 * @author Bea
 */
public class ThreadBank implements Runnable {

	/** The <code>Bank</code> object */
	private Bank bank;

	/**
	 * Builds a new <code>ThreadBank</code> object.
	 * 
	 * @param bank
	 */
	public ThreadBank(Bank bank) {
		this.bank = bank;
	}

	/**
	 * The run method.
	 * 
	 */
	public void run() {
		for (int i = 0; i < 3; i++) {
			makeWithdrawal(10);
			if (bank.getTotalAmount() < 0) {
				System.out.println("-----Bank is overdrawn!");
			}
		}

	}

	/**
	 * Executes a withdrawal process with the given amount of money.
	 * 
	 * @param amount
	 *            The amount of money
	 */
	private synchronized void makeWithdrawal(int amount) {
		String message = "";
		if (bank.getTotalAmount() >= amount) {
			message = Thread.currentThread().getName()
					+ " is going to withdraw ";
			System.out.println(message);

			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

			bank.withdraw(amount);
			message = Thread.currentThread().getName()
					+ " completes with withdraw ";
			System.out.println(message);

		} else {
			message = "Not enough in bank for "
					+ Thread.currentThread().getName() + " to withdraw "
					+ bank.getTotalAmount();
			System.out.println(message);
		}
	}
}
