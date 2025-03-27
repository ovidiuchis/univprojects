public class Persoana {
	public String cnp;
	public String nume;

	Persoana(String a, String b) {
		cnp = a;
		nume = b;
	}

	Persoana() {
		cnp = "";
		nume = "";

	}

	public String getNume() {
		return nume;
	}

	public String getCNP() {
		return cnp;
	}

	public boolean equals(Persoana p) {
		return cnp.equals(p.getCNP());
	}
	public String toString(){
		return nume +" "+cnp;
	}
}
