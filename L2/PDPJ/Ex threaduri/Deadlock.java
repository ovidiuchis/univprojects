package ex;

/**
 * Simple example of a deadlock.
 * 
 * @author Bea
 */
public class Deadlock {

	/**
	 * Inner static class <code>Example</code>.
	 * 
	 * @author Bea
	 */
	static class Example {

		/** The message */
		private final String message;

		/**
		 * Builds a new <code>Example</code> object.
		 * 
		 * @param message The message
		 */
		public Example(String message) {
			this.message = message;
		}

		/**
		 * Returns the message
		 * 
		 * @return The message
		 */
		public String getMessage() {
			return this.message;
		}

		/**
		 * Prints the message of the given object and calls the message2 method.
		 * 
		 * @param example
		 */
		public synchronized void message1(Example example) {
			System.out.println("Received message: " + example.getMessage());
			example.message2(this);
		}

		/**
		 * 
		 * @param example
		 */
		public synchronized void message2(Example example) {
			System.out.println("Received message: " + example.getMessage());

		}
	}

	/**
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		final Example ex1 = new Example("Message 1");
		final Example ex2 = new Example("Message 2");
		for (int i = 0; i < 10; i++) {
			new Thread(new Runnable() {
				public void run() {
					ex1.message1(ex2);
				}
			}).start();
			new Thread(new Runnable() {
				public void run() {
					ex2.message1(ex1);
				}
			}).start();
		}
	}
}
