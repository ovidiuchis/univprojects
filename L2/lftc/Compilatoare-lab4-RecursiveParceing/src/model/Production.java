package model;

import java.util.ArrayList;
import java.util.List;
/**
 * 
 * Production representation as alpha - left hand side, beta - right hand side.
 *
 */
public class Production {  
	/**
	 * alpha->beta
	 * beta= {set of SIGMA and N} | {other set...}|...| {}
	 */
	
	//context data
	private String alpha;
	private List<List<String>> b=new ArrayList<List<String>>();
	//private List<String> b=new ArrayList<String>();
	
	public Production(String alpha, List<List<String>> b) {
		this.alpha = alpha;
		this.b = b;
	}
	public Production(String alpha){
		this.alpha=alpha;
	}
	
	
	
	public String getAlpha() {
		return alpha;
	}
	public void setAlpha(String alpha) {
		this.alpha = alpha;
	}
	
	public List<List<String>> getB() {
		return b;
	}
	
	
	@Override
	public String toString() {
		return "["+ alpha + "->" + b + "]";
	}
	

}
