package Model;

import java.util.List;

public class Functie_10 implements Functie {

	private double minX = -500;
	private double maxX = 500;

	

	public double[] F2D(double[] x) {
		double[] result = new double[x.length];

		for (int i = 0; i < x.length; i++) {
			result[i] = -x[i] * Math.sin(Math.sqrt(Math.abs(x[i])));
		}

		return result;
	}
	public double Fitness (List <Double>  x){
		double result = 0;
		for (int i = 0; i < x.size(); i++) {
			result = result +(-x.get(i)* Math.sin(Math.sqrt(Math.abs(x.get(i)))) );
		}

		return result;
	}
	public double[][] F3D(double[] x, double[] y) {
		double[][] result = new double[x.length][y.length];

		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < y.length; j++) {
				result[i][j] = (-x[i] * Math.sin(Math.sqrt(Math.abs(x[i])))) + (-y[j] * Math.sin(Math.sqrt(Math.abs(y[j]))));
			}
		}

		return result;
	}
	
	public String toString() {
		return "Functie_10";
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
