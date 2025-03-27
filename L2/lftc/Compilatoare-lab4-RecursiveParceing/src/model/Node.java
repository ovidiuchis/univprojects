package model;



public class Node {

	/**
	 *The value represents the terminal/nonterminal in the final sequence
	 * */
	String value;
	/**
	 * is represented as a index in the table
	 * */
	Integer parent;
	/**
	 * is represented as a index in the table.
	 * It refers to the left sibling of the left sibling of the current node 
	 * */
	Integer sibling;
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Integer getParent() {
		return parent;
	}
	public void setParent(Integer parent) {
		this.parent = parent;
	}
	public Integer getSibling() {
		return sibling;
	}
	public void setSibling(Integer sibling) {
		this.sibling = sibling;
	}
	public Node(String value, Integer parent, Integer sibling) {
		super();
		this.value = value;
		this.parent = parent;
		this.sibling = sibling;
	}
	@Override
	public String toString() {
		return "Node [value=" + value + ", parent=" + parent + ", sibling="
				+ sibling + "]";
	}
	
	

}
