package ex.consprod;

/**
 * The test class.
 * 
 * @author Bea
 */
public class Test {

	/**
	 * The main method.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		/* build deposit */
		Deposit deposit = new Deposit();
		
		/* build producer thread and start */
		Producer producer = new Producer(deposit);
		Thread producerTh = new Thread(producer);
		producerTh.setName("Prod. Th1");
		producerTh.start();
		
		/* build consumer thread and start */
		Consumer consumer = new Consumer(deposit);
		Thread consumerTh = new Thread(consumer);
		consumerTh.setName("Cons. Th1");
		consumerTh.start();
	}
}
