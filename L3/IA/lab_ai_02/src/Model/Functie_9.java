package Model;

import java.util.List;

public class Functie_9 implements Functie {

	private double minX = -500;
	private double maxX = 500;

	
	public double[] F2D(double[] x) {
		double[] result = new double[x.length];

		for (int i = 0; i < x.length; i++) {
			result[i] = 0.00025 * x[i] - Math.cos(x[i]) + 1;
		}

		return result;
	}
	public double Fitness (List <Double>  x){
		double result = 0;
		for (int i = 0; i < x.size(); i++) {
			result = result + 0.00025 * x.get(i) - Math.cos(x.get(i)) + 1;
		}

		return result;
	}
	public double[][] F3D(double[] x, double[] y) {
		double[][] result = new double[x.length][y.length];

		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < result.length; j++) {
				result[i][j] = 0.00025 * (x[i]+y[j]) - Math.cos(x[i])*Math.cos(y[j]) + 1;
			}
		}

		return result;
	}
	
	public String toString() {
		return "Functie 9";
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
