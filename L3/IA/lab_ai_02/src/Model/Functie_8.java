package Model;

import java.util.List;

public class Functie_8 implements Functie {

	private double minX = -32;
	private double maxX= 32;

	
	public double[] F2D(double[] x, double a, double b, double c) {
		double[] result = new double[x.length];

		for (int i = 0; i < x.length; i++) {
			result[i] = -a * Math.pow(Math.E, -b * Math.sqrt(x[i])) - Math.pow(Math.E, Math.cos(c * x[i])) + a + Math.E;
		}

		return result;
	}
	public double Fitness (List <Double>  x,double a,double b,double c){
		double result = 0;
		for (int i = 0; i < x.size(); i++) 
			result = result -a * Math.pow(Math.E, -b * Math.sqrt(x.get(i))) - Math.pow(Math.E, Math.cos(c * x.get(i))) + a + Math.E; 
 return result;}
		
	public double[][] F3D(double[] x, double[] y, double a, double b, double c) {
		double[][] result = new double[x.length][y.length];

		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < y.length; j++) {
				result[i][j] = -a * Math.pow(Math.E, -b * Math.sqrt((x[i] + y[j]) / 2))
						- Math.pow(Math.E, Math.cos(c * x[i]) + Math.cos(c*y[j])) + a + Math.E;
			}
		}

		return result;
	}
	
	public String toString() {
		return "Functie 8";
	}

	@Override
	public double getMaxX() {
		// TODO Auto-generated method stub
		return maxX;
	}

	@Override
	public double getMinX() {
		// TODO Auto-generated method stub
		return minX;
	}
}
