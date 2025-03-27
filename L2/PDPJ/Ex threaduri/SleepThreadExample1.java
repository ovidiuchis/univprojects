package ex;

/**
 * Simple example using Thread.sleep() method.
 * 
 * @author Bea
 * 
 */
public class SleepThreadExample1 {
	/**
	 * 
	 * @param args
	 */
	public static void main(String args[]) {
		String array[] = { " Hello World", " sleep object method", " example" };
		try {
			for (int i = 0; i < array.length; i++) {
				// Pause for 2 seconds
				Thread.sleep(2000);
				// Print a message
				System.out.println(array[i]);
			}
		} catch (InterruptedException e) {
			System.out.println(" Error : " + e.getMessage());
		}
	}
}
