package ex;

/**
 * Simple thread example. This class implements the <code>Runnable</code>
 * interface.
 * 
 * @author Bea
 * 
 */
public class RunnableThreadExample1 implements Runnable {

	/**
	 * The run method.
	 */
	public void run() {
		System.out.println("Hello World !");
	}

	/**
	 * The main method.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		/* creates an instance of the <code>ThreadExample1</code> object */
		RunnableThreadExample1 th = new RunnableThreadExample1();

		/* creates a <code>Thread</code> object */
		Thread t = new Thread(th);

		/* start the thread */
		t.start();
	}
}
