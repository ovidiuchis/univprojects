package ex.consprod;


/**
 * The deposit class.
 * 
 * @author Bea
 */
public class Deposit {
	
	/** The content of the deposit */
	private int content;

	/** Flag indicating if the content is available or not */
	private boolean available;

	/**
	 * Returns the content.
	 * 
	 * @return content
	 */
	public synchronized int get() {
		while (available == false) {
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		available = false;
		notifyAll();
		return content;
	}

	/**
	 * Put a new content in the deposit.
	 * 
	 * @param contentValue
	 *            The value of the content
	 */
	public synchronized void put(int contentValue) {
		while (available == true) {
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		content = contentValue;
		available = true;
		notifyAll();
	}

}
