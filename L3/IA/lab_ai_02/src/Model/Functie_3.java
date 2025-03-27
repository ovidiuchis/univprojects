package Model;

import java.util.List;

public class Functie_3 implements Functie {

	private double minX = -10;
	private double maxX = 10;


	public String toString() {
		return "Functie 3";
	}

	public double[] F2D(double[] x) {
		double[] result = new double[x.length];
		for (int i = 0; i < x.length; i++) {
			result[i] = 2 * Math.abs(x[i]);
		}

		return result;
	}
	public double Fitness (List <Double>  x){
		double result = 0;
		for (int i = 0; i < x.size(); i++) {
			result = result +2 * Math.abs(x.get(i));
		}

		return result;
	}
	public double[][] F3D(double[] x, double[] y) {
		double[][] result = new double[x.length][y.length];
		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < y.length; j++) {
				result[i][j] = Math.abs(x[i]) + Math.abs(y[j]) + Math.abs(x[i]) * Math.abs(y[i]);
			}
		}

		return result;
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
