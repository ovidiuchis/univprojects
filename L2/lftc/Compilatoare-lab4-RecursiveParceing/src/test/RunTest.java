package test;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import services.Parser;
import model.Grammar;
import model.Node;
/**
 * 
 * Performs the testing of the Parser for a Grammar and a sequence PIF.
 *
 */
public class RunTest {
	
	public static void main(String args[]){
		Grammar gr=new Grammar("grammar final.txt");
		System.out.println(gr.toString());
		Parser parser=new Parser();
		List<Integer> PIF=new ArrayList<Integer>();
		PIF.add(12);
		PIF.add(11);
		PIF.add(25);
		PIF.add(26);
		PIF.add(29);
		PIF.add(2);
		PIF.add(0);
		PIF.add(20);
		PIF.add(0);
		PIF.add(19);
		PIF.add(1);
		PIF.add(20);
		PIF.add(30);
		parser.recursiveParse(gr, PIF);
		Vector<Node> vn=new Vector<Node>();
		vn=parser.generateTree();
		System.out.println("Tree:");
		System.out.println("---------");
		for(Node n:vn)
			System.out.println("Index "+vn.indexOf(n)+"  "+n);
		
	}

}
