package services;

import java.util.List;
import java.util.Stack;
import java.util.Vector;

import model.Grammar;
import model.Node;
import model.Production;
/**
 * Class parser performs a recursive parsing of a grammar, verifying if a sequence belongs to that
 * grammar. The output is a table representation (parent, left sibling) of the Parsing Tree.
 * 
 * @author Alina, David
 *
 */

public class Parser {
	private Grammar g;
	private int n;
	private List<Integer> PIF;
	private Vector<String> result;

	/**
	 * Performing a Recursive Parsing of a grammar, verifies if a sequence belongs to the grammar.
	 * Can be used for the PIF of a program source code and for the grammar corresponding to 
	 * the language of the program. 
	 * 
	 * This function does the initializations and calls the recursive function RP.
	 * @param g is Grammar
	 * @param PIF is a list of Integer : the sequence (or PIF)
	 */
	public void recursiveParse(Grammar g, List<Integer> PIF) {
		this.g = g;
		n = PIF.size();
		this.PIF = PIF;
		char state = 'q';
		int i = 1;
		Stack<String> alpha = new Stack<String>();
		Stack<String> beta = new Stack<String>();
		beta.add(g.getS());

		System.out.println("alpha :" + alpha + ":beta" + beta+state+i);
		RP(state, i, alpha, beta);

	}

	/**
	 * RP is a function that makes the computation needed to pass from a state to an other, 
	 * and generate the sequence recursively from the grammar. If the sequence belongs to 
	 * the grammar, returns a corresponding message, else it prints the error identified 
	 * during computation and the conclusion that sequence does not belong to grammar.
	 * 
	 * @param state : can be q,b,e or t
	 * @param i   : step
	 * @param alpha  : working stack
	 * @param beta :input stack
	 */
	private void RP(char state, int i, Stack<String> alpha, Stack<String> beta) {
		switch (state) {
		case 'q':
			if (beta.isEmpty())
				if (i == n + 1) {
					state = 't';
					System.out.println("alpha :" + alpha + ":beta" + beta+state+i);
					RP(state, i, alpha, beta);
				} else {
				}
			else {
				String elem = beta.pop();
				// case 1: elem is terminal, elem=the i-th element of the
				// sequence

				if (PIF.size()>=i && elem.equals(PIF.get(i - 1).toString())) {
					System.out.println("got a terminal..." + elem);
					if (g.getSIGMA().contains(elem))
						i++;
					alpha.push(elem);
					System.out.println("alpha :" + alpha + ":beta" + beta+state+i);
					RP(state, i, alpha, beta);
				} else // elem is teminal, but not equal to the i-th elem
				// of seq

				if (g.getSIGMA().contains(elem)) {
					System.out.println("got a terminal..." + elem);
					state = 'b';// back=another try
					beta.push(elem);
					System.out.println("alpha :" + alpha + ":beta" + beta+state+i);
					RP(state, i, alpha, beta);
				}

				else if (g.getN().contains(elem)) { // elem is nonterminal
					System.out.println("got a nonterminal..." + elem);
					Production elemp = new Production(elem);
					for (Production p : g.getP()) {
						if (p.getAlpha().equals(elem))
							for (List<String> pl : p.getB())
								elemp.getB().add(pl);
					}

					if (!elemp.getB().isEmpty()) {
						alpha.add(elem+1);
					
						List<String> l = elemp.getB().get(0);
						for (int j = l.size() - 1; j >= 0; j--)
							beta.add(l.get(j));

						System.out.println("alpha :" + alpha + ":beta" + beta+state+i);
						RP(state, i, alpha, beta);
					}
				} else
					System.out
							.println(" Error : unrecognised symbol : " + elem);
			}

			break;
		case 'b':
			String elem = alpha.pop();
			if (g.getSIGMA().contains(elem)) { // terminal
				System.out.println("b:got a terminal..." + elem);
				beta.push(elem);
				i--;
				System.out.println("alpha :" + alpha + ":beta"
						+ beta+state+i);
				RP(state, i, alpha, beta);
			} else {
				String eln = elem.charAt(0) + "";
				int j=0;
				if (elem.length()==2)
				   j=Integer.parseInt(elem.charAt(1)+"");
				else if (elem.length()==3)
					j=Integer.parseInt(elem.charAt(1)+elem.charAt(2)+"");
				
				if (g.getN().contains(eln)) { // nonterminal
					System.out.println("b:got a nonterminal..." + elem);
					Production elemp = new Production(eln);
					for (Production p : g.getP()) {
						if (p.getAlpha().equals(eln))
							for (List<String> pl : p.getB())
								elemp.getB().add(pl);
					}
					//int j = prodApl.get(eln);
					
					List<String> sl = elemp.getB().get(j - 1);
				
					for (int k = 0; k < sl.size(); k++) {
						if (!beta.pop().equals(sl.get(k))) {
							//aux.push(beta.pop());
							System.out
									.println("error in back state : Ai->gi  not existent");
							System.out.println("elem :" + elem + ":" + elemp);

							System.out.println("j :" + j + ":" + eln);
							System.out.println("alpha :" + alpha + ":beta"
									+ beta+state+i);
						}
					}
					if (j < elemp.getB().size()) {
						j++;
						state = 'q';
						alpha.add(eln + j);
						
							
						List<String> l = elemp.getB().get(j - 1);
						for (int k = l.size() - 1; k >= 0; k--)
							beta.add(l.get(k));
						System.out.println("alpha :" + alpha + ":beta" + beta+state+i);
						RP(state, i, alpha, beta);
					} else // no other productions left
					{
						// String eln=elem.charAt(0)+"";
						if ((!g.getS().equals(elem)) && (i != 1)) {
						//	while (!aux.isEmpty())
							//	beta.push(aux.pop());
							beta.push(eln);
							System.out.println("alpha :" + alpha + ":beta"
									+ beta+state+i);
							RP(state, i, alpha, beta);
						} else {
							// error
							state = 'e';
							System.out.println("elem :" + elem + ":" + elemp);

							System.out.println("j :" + j + ":" + eln);
							System.out.println("alpha :" + alpha + ":beta"
									+ beta+state+i);
							RP(state, i, alpha, beta);
						}

					}

				} else
					System.out
							.println(" Error : unrecognised symbol : " + elem);
			}
			break;
		case 'e':// error
			System.out.println("Sequence does not belogs to grammar.");
			System.out.println("alpha=" + alpha.toString());
			break;
		case 't':// finish, sequence belogn to grammar
			System.out.println("Sequence belogs to grammar.");
			System.out.println("alpha=" + alpha.toString());
			result=new Vector<String>();
			result.addAll(alpha);
			break;

		}

	}
	/**
	 * @return Represents a table of nodes generated for the tree
	 * */
	public Vector<Node> generateTree()
	{
		if(this.result==null)
		   return null;
		
		Stack<Integer> nonterm=new Stack<Integer>();
		Stack<Integer> remelem=new Stack<Integer>();
		Vector<Integer> lastsibl=new Vector<Integer>();
		Vector<Node> tree=new Vector<Node>();
		Integer level=0;
		
		tree.add(new Node(result.get(0).charAt(0)+"",-1,-1));
		nonterm.add(0);
		remelem.add(getNoElem(result.get(0)));
		lastsibl.add(-1);
		for(int i=1;i<result.size();i++)
		{
			while(remelem.peek()==0)
			{
				remelem.pop();
				nonterm.pop();
				level--;
			}
		    if(result.get(i).length()==1)
		    {	
		    	Node n=new Node(result.get(i),nonterm.peek(),lastsibl.get(level));
		    	tree.add(n);
		    	lastsibl.setElementAt(tree.indexOf(n), level);
		    	remelem.push(remelem.pop()-1);
		    }
		    else
		    {
		    	Node n=new Node(result.get(i).charAt(0)+"",nonterm.peek(),lastsibl.get(level));
		    	tree.add(n);
		    	remelem.push(remelem.pop()-1);
		    	remelem.push(getNoElem(result.get(i)));
		    	lastsibl.setElementAt(tree.indexOf(n), level);
		    	level++;
		    	if(lastsibl.size()<=level)
		    		lastsibl.add(level,-1);

		    	nonterm.push(tree.indexOf(n));
		    }
		    
		}
		return tree;
	}
    /**
     * 
     * @param string Represents an element in the right hand side of the production
     * @return Returns the number of terminals and nonterminals appear in 
     * the given element of the rhs of the production
     */
	private Integer getNoElem(String string) {
		String nonterm=string.charAt(0)+"";
		Integer prodno=Integer.parseInt(string.substring(1))-1;
		for(Production p:g.getP())
			if(p.getAlpha().equals(nonterm))
				return p.getB().get(prodno).size();
		
		return null;
	}

}
