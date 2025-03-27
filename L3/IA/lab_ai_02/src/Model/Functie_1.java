package Model;

import java.util.List;

public class Functie_1 implements Functie{
	private double minX = -10;
	private double maxX = 10;

	
	
	public double F(double x, int i) {
		return i * x * x;
	}

	public double[] F2D(double[] data) {
		double[] result = new double[data.length];
		for (int i = 0; i < result.length; i++) {
			result[i] = F(data[i], i + 1);
		}

		return result;
	}

	public double[][] F3D(double[] x, double[] y) {
		double[][] result = new double[x.length][y.length];
		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < y.length; j++) {
				result[i][j] = F(x[i], 1) + F(y[j], 2);
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
		return "Functie_1";
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
