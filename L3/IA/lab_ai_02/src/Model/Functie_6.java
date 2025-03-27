package Model;

import java.util.List;


public class Functie_6 implements Functie {

	private double minX = -30;
	private double maxX = 30;


	public double[][] F3D(double[] x, double[] y) {
		double[][] result = new double[x.length][y.length];

		for (int i = 0; i < x.length; i++) {
			for (int j = 0; j < y.length; j++) {
				result[i][j] = F(x[i], y[j]);
			}
		}

		return result;}
	
		public double[] F2D (double [] data){
			
			return data;
		
	}
		public double Fitness (List <Double>  x){
			double result = 0;
			for (int i = 0; i < x.size(); i++) {
				result = result +F(x.get(i), i + 1);
			}

			return result;
		}

	public double F(double d, double e) {
		return 100 * ( (e-d*d)*(e-d*d) ) + (1 - d)*(1 - d);
	}
	
	public String toString() {
		return "Functie 6";
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
