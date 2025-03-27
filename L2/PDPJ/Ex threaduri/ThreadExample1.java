package ex;

/**
 * Simple thread example.
 * 
 * @author Bea
 *
 */
public class ThreadExample1 extends Thread{

	/**
	 * The run method.
	 */
	public void run(){
		System.out.println("Hello World!");
	}
	
	/**
	 * The main method.
	 * 
	 * @param args
	 */
	public static void main(String[] args){
		new ThreadExample1().start();
	}
}
