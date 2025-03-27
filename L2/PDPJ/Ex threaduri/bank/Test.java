package ex.bank;

/**
 * Test class for the bank thread.
 * 
 * @author Bea
 */
public class Test {

	/**
	 * The main method.
	 * 
	 * @param args
	 */
	public static void main(String args[]){
		/** build thread bank */
		ThreadBank tb=new ThreadBank(new Bank(50));
		
		/** create 'clients' */
		Thread one=new Thread(tb);
		Thread two =new Thread(tb);
		Thread three =new Thread(tb);
		one.setName("Tom");
		two.setName("Lucy");
		three.setName("Barney");
		
		/** start the threads */
		one.start();
		two.start();
		three.start();
	}
}
