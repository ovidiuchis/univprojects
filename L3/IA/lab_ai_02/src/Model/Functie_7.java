package Model;

import java.util.List;

public class Functie_7 implements Functie {

	private double minX = -5;
	private double maxX = 5;

	
	
	public double[] F2D(double[] x){
		double[] result = new double[x.length];
		for (int i = 0; i < x.length; i++) {
			result[i] = 10 + x[i]*x[i] - 10 * Math.cos(2 * Math.PI * x[i]);
		}
		
		return result;
	}
	public double Fitness (List <Double>  x){
		double result = 0;
		for (int i = 0; i < x.size(); i++) {
			result = result +10 + x.get(i)*x.get(i) - 10 * Math.cos(2 * Math.PI * x.get(i));
		}

		return result;
	}
	public double[][] F3D(double[] x, double[] y) {
		double[][] result = new double[x.length][y.length];
		
		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < y.length; j++) {
				result[i][j] = 10 * 2 + (x[i]*x[i] - 10 * Math.cos(2 * Math.PI * x[i])) +
				(y[j]*y[j] - 10 * Math.cos(2 * Math.PI * y[j]));
			}
		}
		
		return result;
	}
	
	public String toString() {
		return "Functie 7";
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
