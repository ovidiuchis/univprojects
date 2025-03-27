package ex.bank;

/**
 * The bank class.
 * 
 * @author Bea
 */
public class Bank {
	
	/** The total amount of money in the bank*/
	private int totalAmount;
	
	/**
	 * Builds a new <code>Bank</code> object
	 * 
	 * @param totalAmount the total amount of money in the bank.
	 */
	public Bank(int totalAmount){
		this.totalAmount=totalAmount; 
	}
	
	/**
	 * Returns the total amount
	 * 
	 * @return totalAmount
	 */
	public int getTotalAmount(){
		return totalAmount;
	}
	
	/**
	 * Withdraw a client . 
	 * 
	 * @param amount
	 */
	public void withdraw(int amount){
		totalAmount=totalAmount-amount;
	}
}
