package Model;

import java.util.List;

public class Functie_2 implements Functie{

	private double minX = -100;
	private double maxX = 100;

	public double F(double x) {
		return x*x;
	}

	public double[] F2D(double[] data) {
		double[] result = new double[data.length];
		for (int i = 0; i < data.length; i++) {
			result[i] = F(data[i]);
		}
		
		return result;
	}
	public double Fitness (List <Double>  x){
		double result = 0;
		for (int i = 0; i < x.size(); i++) {
			result = result +x.get(i)*x.get(i);
		}

		return result;
	}
	
	public double[][] F3D(double[] x, double[] y) {
		double[][] result = new double[x.length][y.length];
		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < y.length; j++) {
				result[i][j] = F(x[i]) + F(y[j]);
			}
		}
		
		return result;
	}

	public double getMinX() {
		return minX;
	}

	public double getMaxX() {
		return maxX;
	}
	
	public String toString() {
		return "Functie 2";
	}

}
