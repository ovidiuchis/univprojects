package ex;

/**
 * Simple thread example . This class implements the <code>Runnable</code>
 * interface.
 * 
 * @author Bea
 * 
 */
public class RunnableThreadExample2 implements Runnable {

	/**
	 * The run method.
	 */
	public void run() {
		for (int i = 0; i <= 3; i++) {
			System.out.println("Run by: " + Thread.currentThread().getName()
					+ ", i:" + i);
		}
	}

	/**
	 * The main method.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		/* creates an instance of the <code>ThreadExample2</code> object */
		RunnableThreadExample2 th = new RunnableThreadExample2();

		/* create the threads */
		Thread one = new Thread(th);
		Thread two = new Thread(th);
		Thread three = new Thread(th);

		/* set the name of the threads */
		one.setName("Tom");
		two.setName("Lisa");
		three.setName("Yerry");

		/* start the threads */
		one.start();
		two.start();
		three.start();
	}

}
