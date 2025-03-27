package ex;

/**
 * Simple thread example.
 * 
 * @author Bea
 */
public class ThreadExample2 extends Thread {

	/**
	 * The run method.
	 */
	public void run() {
		for (int i=0; i<=3;i++){
			System.out.println("Run by: "+Thread.currentThread().getName()+", i:"+i);
		}
	}
	
	/**
	 * The main method.
	 * 
	 * @param args
	 */
	public static void main(String[]args){
		/** create the threads */
		ThreadExample2 one=new ThreadExample2();
		ThreadExample2 two=new ThreadExample2();
		ThreadExample2 three=new ThreadExample2();
		
		/** set the name of the threads */
		one.setName("Tom");
		two.setName("Lisa");
		three.setName("Yerry");
		
		/** start the theads */
		one.start();
		two.start();
		three.start();
	}
}
