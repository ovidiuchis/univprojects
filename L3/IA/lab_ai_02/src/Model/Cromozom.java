package Model;

import java.util.ArrayList;
import java.util.List;


public class Cromozom {

    public double getFitness() {
        return fitness;
    }

    public void setFitness(double fitness) {
        this.fitness = fitness;
    }

    public List<Double> getListaX() {
        return listaX;
    }

    public void setListaX(List<Double> listaX) {
        this.listaX = listaX;
    }


    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }

    private List<Double> listaX ;
    private int n;
    private double fitness;

    public Cromozom(int n) {
        listaX= new ArrayList<Double>(n);
    }

    public void setValAtForListaX (double val,int poz)
    { //this.listaX.set(poz, val);
    this.listaX.add(poz, val);
    }

    public void addToListaX (double val)
    { this.listaX.add(val);
    }

    public double getValAt (int poz)
    {   //System.out .println ("pozitie in rand 53 "+ poz);
    	return listaX.get(poz);
    }

    @Override
    public String toString() {
        return "   "+this.fitness;
    }
public String afisare ()
{   String result="";
int i;
   for (i=0; i< listaX.size();i++)
	result = result + " / " +listaX.get(i)+" "+ i;
   return result;
}
}