package GUI;

import javax.swing.JFrame;

import org.math.plot.Plot2DPanel;
import org.math.plot.Plot3DPanel;

public class Plot extends JFrame {
	public static final int PLOT_3D = 2;
	public static final int PLOT_2D = 1;
	private static final long serialVersionUID = 1L;

	private Plot2DPanel plot2D;
	private Plot3DPanel plot3D;

	public Plot(int plotType, double[] x, double[] y, double[][] z) {
		super("Grafic functie");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setSize(700, 700);

		switch (plotType) {
		case PLOT_2D:
			plot2D = new Plot2DPanel();
			plot2D.addLegend("SOUTH");
			plot2D.addScatterPlot(" punct ", x, y);
			setContentPane(plot2D);
			break;
		case PLOT_3D:
			plot3D = new Plot3DPanel();
			plot3D.addLegend("SOUTH");
			// plot3D.addScatterPlot(" punct ", z);

			setContentPane(plot3D);
			break;

		default:
			System.out.println("[WARN]: Unknown plot type.");
			break;
		}

	}

	public void addLinePlot2D(String name, double[] x, double[] y) {
		if (plot2D != null)
			plot2D.addLinePlot(name, x, y);
		else
			System.out.println("[WARN]: Plot type is not 2D.");
	}

	public void addGridPlot3D(String name, double[] x, double[] y, double[][] z) {
		if (plot3D != null)
			plot3D.addGridPlot(name, x, y, z);
		else
			System.out.println("[WARN]: Plot type is no 3D.");
	}

}
