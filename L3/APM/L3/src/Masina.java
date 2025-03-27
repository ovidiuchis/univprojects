
public class Masina {
	public String denumire;
	public int distanta;
	public int  timp_parcurs;
	public int viteza=0;
	
	public Masina(String a,int  d,int t){
		denumire=a;
		distanta=d;
		timp_parcurs=t;
	}
	public Masina(){
		denumire="";
		
	}
	public Masina(String s){
		denumire = s;
	}
	public String getD(){
		return denumire;
	}
	@Override
	public boolean equals(Object m){
		return denumire==((Masina)m).getD();
	}
	void setDist(int s){
		distanta=s;
	}
	void setT(int s){
		timp_parcurs=s;
	}
	int getDist(){
		return distanta;
	}
	int getTime(){
		return timp_parcurs;
	}
	public String toString(){
		return denumire +" "+" "+ distanta +" "+" "+ timp_parcurs+" " +viteza;
	}
	public int getV(){
	return viteza;
	}
	public void setV(int v){
	viteza=v;
	}

}
