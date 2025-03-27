package ex;

/**
 * Simple example using Thread.sleep(), start(), join(), isAlive() and
 * interrupt() thread related methods.
 * 
 * @author Bea
 * 
 */
public class RunnableThreadExample3 {

	/**
	 * Displays the message with the thread name.
	 * 
	 * @param message
	 */
	static void threadMessage(String message) {
		String threadName = Thread.currentThread().getName();
		System.out.format("%s: %s%n", threadName, message);
	}

	/**
	 * Inner thread class. This class implements the <code>Runnable</code>
	 * interface.
	 * 
	 * @author Bea
	 * 
	 */
	private static class MessageLoop implements Runnable {

		/**
		 * The run method. Displays the strings from the array.
		 */
		public void run() {
			String array[] = { " Hello World", " sleep object method",
					" example" };

			try {
				for (int i = 0; i < array.length; i++) {
					// Pause for 2 seconds
					Thread.sleep(2000);
					// Print a message
					threadMessage(array[i]);
				}
			} catch (InterruptedException e) {
				threadMessage("I wasn't done!");
			}
		}
	}

	/**
	 * The main method.
	 * 
	 * @param args 
	 * @throws InterruptedException
	 */
	public static void main(String args[]) throws InterruptedException {

		// Delay, in milliseconds before we interrupt MessageLoop
		// thread (default one hour).
		long patience = 1000 * 60 * 60;

		// If command line argument present, gives patience in seconds.
		if (args.length > 0) {
			try {
				patience = Long.parseLong(args[0]) * 1000;
			} catch (NumberFormatException e) {
				System.err.println("Argument must be an integer.");
				System.exit(1);
			}

		}

		threadMessage("Starting MessageLoop thread");
		long startTime = System.currentTimeMillis();
		Thread t = new Thread(new MessageLoop());
		t.start();

		threadMessage("Waiting for MessageLoop thread to finish");
		// loop until MessageLoop thread exits
		while (t.isAlive()) {
			threadMessage("Still waiting...");
			// Wait maximum of 1 second for MessageLoop thread to
			// finish.
			t.join(1000);
			if (((System.currentTimeMillis() - startTime) > patience)
					&& t.isAlive()) {
				threadMessage("Tired of waiting!");
				t.interrupt();
				t.join();
			}

		}
		threadMessage("Finally!");
	}
}