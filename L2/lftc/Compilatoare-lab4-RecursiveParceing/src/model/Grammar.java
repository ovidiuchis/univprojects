package model;

import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Grammar {
	/**
	 * N is the set of Nonterminals
	 */
	private List<String> N = new LinkedList<String>();
	/**
	 * SIGMA is the set of terminals
	 */
	private List<String> SIGMA = new LinkedList<String>();
	/**
	 * P is the set of productions
	 * @see Production 
	 */
	private List<Production> P = new LinkedList<Production>();
	/**
	 * S is the starting symbol
	 */
	private String S;

	/**
	 * Constructs a grammar , reading data from a file, structured on lines as:
	 * line 1: set N of non-terminals, separated by space line 2: set SIGMA of
	 * symbols,separated by space line 3: set of productions, productions
	 * separated by ; line 4: S - starting symbol
	 * 
	 * @param filename
	 */
	public Grammar(String filename) {
		readGrammar(filename);
	}

	/**
	 * construct the equivalent reg grammar from a FA
	 * 
	 * @param fa
	 */
	/*public Grammar(FiniteAutomata fa) {
		N = fa.getQ();
		SIGMA = fa.getSIGMA();
		S = fa.getQZero();
		createPFromDelta(fa);
	}*/

	/**
	 * This method creates the set of Productions from the delta function of the
	 * FA fa for the equivalent corresponding reg grammar.
	 * 
	 * @param fa
	 */
	/*private void createPFromDelta(FiniteAutomata fa) {
		P.clear();
		String[][][] d = fa.getDelta();
		for (int lin = 0; lin < fa.getQ().size(); lin++) {
			List<String> rhsList = new ArrayList<String>();
			for (int col = 0; col < fa.getSIGMA().size(); col++) {
				String elem = "";
				for (String s : d[lin][col]) {
					if (s != null && !s.trim().equals("")) {
						elem = fa.getSIGMA().get(col) + s;
						rhsList.add(elem);
						if (fa.getF().contains(s)) {
							elem = fa.getSIGMA().get(col);
							rhsList.add(elem);
						}

					}
				}

			}

			if (fa.getQ().get(lin).equals(fa.getQZero())
					&& fa.getF().contains(fa.getQZero())) {
				rhsList.clear(); // ?
				rhsList.add("e");
				Production p = new Production(fa.getQ().get(lin), rhsList);
				P.add(p);
			} else if (rhsList.size() > 0) {
				Production p = new Production(fa.getQ().get(lin), rhsList);
				P.add(p);
			}
		}

	}
*/
	/**
	 * reads data from a file and constructs a grammar
	 * 
	 * @param filename
	 */
	private void readGrammar(String filename) {
		try {
			RandomAccessFile file = new RandomAccessFile(filename, "r");
			String line;
			int i = 0;
			while ((line = file.readLine()) != null && i < 4) {
				i++;
				switch (i) {
				case 1: {
					String n[] = line.split(" ");
					for (String s : n)
						N.add(s.trim());
					break;
				}
				case 2:
					String sigma[] = line.split(" ");
					for (String s : sigma)
						SIGMA.add(s.trim());
					break;
				
				case 3:
					S = line.trim();
					break;
				case 4:
					//read prods
					i++;
					//int nr=Integer.parseInt(line.trim());
					//for (int l=0; l<nr; l++){
					
					do{

						String p[] = line.trim().split("->");
						String pp[] = p[1].trim().split("\\|");
						List<List<String>> rez = new ArrayList<List<String>>();
						
						for (String el : pp) {
							List<String> subrez=new ArrayList<String>();
							String ppp[]=el.trim().split(" ");
							for (String elem: ppp)
							   if (!elem.trim().equals(""))
								    subrez.add(elem.trim());
							rez.add(subrez);

						}
						Production prod = new Production(p[0].trim(), rez);
						P.add(prod);
					}
					while ((line = file.readLine()) != null);
					
					break;

				}

			}
			;
			file.close();
		} catch (Exception e) {
			System.err.println("Error IO. file :" + filename);
		}
		;

	}

	@Override
	public String toString() {
		return "Grammar [N=" + N + ",\n P=" + P + "\n, S=" + S + "\n, SIGMA=" + SIGMA
				+ "]\n";
	}

	/**
	 * calculate production of a non terminal symbol ex for S->ab|aS
	 * 
	 * @return list {ab, aS}
	 */
	/*public List<String> getResult(String n) {
		for (Production p : P)
			if (p.getAlpha().equals(n))
				return p.getB();
		return new ArrayList<String>();
	}
*/
	public List<String> getN() {
		return N;
	}

	public void setN(List<String> n) {
		N = n;
	}

	public List<String> getSIGMA() {
		return SIGMA;
	}

	public void setSIGMA(List<String> sIGMA) {
		SIGMA = sIGMA;
	}

	public List<Production> getP() {
		return P;
	}

	public void setP(List<Production> p) {
		P = p;
	}

	public String getS() {
		return S;
	}

	public void setS(String s) {
		S = s;
	}

	/**
	 * calculate productions derived from symbol s.
	 * 
	 * @param symbol
	 * @return list of possible results after applying all possible derivation.
	 *         where a symbo apperas many time, only the first appearance is
	 *         considered
	 */
	/*public List<String> calculateProductions(String symbol) {
		List<String> rezult = new ArrayList<String>();
		if (N.contains(symbol))
			return getResult(symbol);

		for (Production prod : P) {
			if (symbol.contains(prod.getAlpha())) {
				for (String rez : prod.getB()) {
					String copy = symbol;
					// while (symbol.contains(prod.getAlpha())){

					rezult.add(copy.replaceFirst(prod.getAlpha(), rez));
					// }
				}
			}
		}

		return rezult;
	}*/

	/**
	 * 
	 * @return list of node from which e (epsilon, empty word) can be derived
	 */
	/*public List<String> getListofNtoe() {
		List<String> rhsN = new LinkedList<String>(); // interdicted N in the
		for (Production p : P) {
			for (String s : p.getB()) {
				if (s.contains("e")) {
					rhsN.add(p.getAlpha());
				}
			}
		}
		return rhsN;
	}*/

	/**
	 * verify is the grammar constructed is regular
	 * 
	 * @return true if it is, false otherwise
	 */
	/*public boolean isRegular() {

		
		// use for epsilon check
		List<String> rhsN = new LinkedList<String>(); 
		for (Production p : P) {
			List<String> list = p.getB();
			if (p.getAlpha().trim().length()>2 )
				return false;
			if (p.getAlpha().trim().length()==2 && (!N.contains(p.getAlpha())))
				return false;
			for (String s : list) {

				if (s.length() == 1 && s.equals("e")) {
					if (S.equals(p.getAlpha()))
						rhsN.add(p.getAlpha());
					else
						return false;
				} else if (s.length() == 1 && SIGMA.contains(s)) {

				} else if (s.length()==1 ){
					return false;
				}
				else
					if (s.length() == 2) {
					if (N.contains(s.charAt(1) + "")
							&& SIGMA.contains(s.charAt(0) + "")) {
						
					} else if (N.contains(s.charAt(0) + "")
							&& SIGMA.contains(s.charAt(1) + "")) {
						
					}

					else {
						return false;
					}
				} else if (s.length() == 3) { // case we name them N={q1,q2}
					
					if (N.contains(s.substring(1, 3) + "")
							&& SIGMA.contains(s.charAt(0) + "")) {
						
					} else if (N.contains(s.substring(0, 2))
							&& SIGMA.contains(s.charAt(2) + "")) {
						
					}else return false;
				} else if (s.length() >= 4) {// case N={q1,q2} SIGMA={S1, S1}

					return false;
				} else if (s.trim().length() == 0) {

				} 

			}
			
		}
		for (Production p : P)
			for (String s : p.getB())
				for (String interdicted : rhsN)
					if (s.contains(interdicted))
						return false;

		return true;
	}*/
}
