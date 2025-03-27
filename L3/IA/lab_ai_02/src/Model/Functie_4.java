package Model;

import java.util.List;

public class Functie_4 implements Functie {

	private double minX = -100;
	private double maxX= 100;

	
	
	public double[] F2D(double[] x) {
		return x; 
	}

	public double[][] F3D(double[] x, double[] y) {
		double[][] result = new double[x.length][y.length];
		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < y.length; j++) {
				result[i][j] = x[i] + x[i] + y[j];
			}
		}
		
		return result;
	}
	public double Fitness (List <Double>  x){
		double result = 0;
		for (int i = 0; i < x.size(); i++) {
			result = result +x.get(i);
		}

		return result;
	}
	
	public String toString() {
		return "Functie 4";
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
