package GUI;

import static org.math.array.DoubleArray.increment;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.geom.Point2D;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JSpinner;
import javax.swing.JTextField;
import javax.swing.SpinnerModel;
import javax.swing.SpinnerNumberModel;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import Model.*;

import java.util.Random;
import java.awt.*;

import javax.swing.*;

import org.math.plot.*;
import org.math.plot.render.*;

/**
 * Class that represents the main window
 * 
 * @author Ovidiu Chis
 */
public class GO extends javax.swing.JFrame implements ActionListener {
	private static final long serialVersionUID = 1L;
	private javax.swing.JButton plotButton;
	private javax.swing.JButton resetButton;
	private javax.swing.JComboBox functionsCombo;
	private javax.swing.JLabel jLabel1;
	private javax.swing.JLabel jLabel2;
	private javax.swing.JLabel jLabel3;
	private javax.swing.JLabel jLabel4;
	private javax.swing.JLabel jLabel5;
	private javax.swing.JLabel jLabel6;
	private javax.swing.JLabel jLabel7;
	private javax.swing.JSeparator jSeparator1;
	private javax.swing.JTextField lowerBoundText;
	private javax.swing.JTextField upperBoundText;
	private javax.swing.JSpinner dimensionText;
	private List<Object> listaFunctii;
	private JLabel jLabel8;
	private JTextField plotPointsText;
	private javax.swing.JLabel jLabel9;
	private javax.swing.JLabel jLabel10;
	public int dimPop;

	/** Creates new form MainWindow */
	public GO() {
		// add all functions in this arrayList
		listaFunctii = new ArrayList<Object>();
		listaFunctii.add(new Functie_1());
		listaFunctii.add(new Functie_2());
		listaFunctii.add(new Functie_3());
		listaFunctii.add(new Functie_4());
		listaFunctii.add(new Functie_5());
		listaFunctii.add(new Functie_6());
		listaFunctii.add(new Functie_7());
		listaFunctii.add(new Functie_8());
		listaFunctii.add(new Functie_9());
		listaFunctii.add(new Functie_10());

		initComponents();

		loadFunctionParameters();

		// AlgoritmGenerational();

	}

	/**
	 * This method is called from within the constructor to initialize the form.
	 */
	private void initComponents() {

		jLabel1 = new javax.swing.JLabel();
		functionsCombo = new javax.swing.JComboBox();
		jLabel2 = new javax.swing.JLabel();
		jSeparator1 = new javax.swing.JSeparator();
		jLabel3 = new javax.swing.JLabel();
		lowerBoundText = new javax.swing.JTextField();
		jLabel4 = new javax.swing.JLabel();
		upperBoundText = new javax.swing.JTextField();
		jLabel5 = new javax.swing.JLabel();
		SpinnerModel model = new SpinnerNumberModel(1, 1, 100, 1);
		dimensionText = new JSpinner(model);
		jLabel6 = new javax.swing.JLabel();
		jLabel7 = new javax.swing.JLabel();
		plotButton = new javax.swing.JButton();
		resetButton = new javax.swing.JButton();
		jLabel8 = new javax.swing.JLabel();
		plotPointsText = new javax.swing.JTextField();

		jLabel9 = new javax.swing.JLabel();
		jLabel10 = new javax.swing.JLabel();

		Scanner scanner = null;
		try {
			scanner = new Scanner(new File("data/date"));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		}
		while (scanner.hasNextLine()) {

			pop = (Integer.parseInt(scanner.nextLine()));
			generatii = (Integer.parseInt(scanner.nextLine()));
		}
		System.out.println(pop + "  " + generatii);

		setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
		setTitle("lab2 ----------------Grafice 2d-3d ");
		setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

		jLabel8.setText("Puncte :");
		jLabel1.setText("Lista functii: ");
		jLabel9.setText("Numar generatii:");
		jLabel10.setText("Dim populatie:");
		dimensionText.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) {
				try {
					switch ((Integer) dimensionText.getValue()) {
					case 1:
						jLabel7.setText("2D Plot");
						plotPointsText.setEnabled(true);
						break;
					case 2:
						jLabel7.setText("3D Plot");
						plotPointsText.setEnabled(true);
						break;
					default:
						if ((Integer) dimensionText.getValue() < 1) {
							dimensionText.setValue(1);
							jLabel7.setText("2D Plot");
						} else
							jLabel7.setText("No Plot");

						plotPointsText.setEnabled(false);
					}
				} catch (Exception e2) {
					System.out.println("[ERROR]: Dimensiune negativa");
					dimensionText.setValue(1);
				}
			}
		});

		functionsCombo.setModel(new javax.swing.DefaultComboBoxModel(
				listaFunctii.toArray()));
		functionsCombo.setSelectedIndex(0);
		functionsCombo.addActionListener(this);

		jLabel2.setText("Date functii:");

		jLabel3.setText("minX: ");

		jLabel4.setText("maxX:");

		jLabel5.setText("Dimensiune 1/2:");

		jLabel6.setText("Tip grafic:");

		jLabel7.setText("2D Plot");

		plotButton.setText("Deseneaza grafic");
		plotButton.addActionListener(this);

		resetButton.setText("Valori implicite");
		resetButton.addActionListener(this);

		javax.swing.GroupLayout layout = new javax.swing.GroupLayout(
				getContentPane());
		getContentPane().setLayout(layout);
		layout
				.setHorizontalGroup(layout
						.createParallelGroup(
								javax.swing.GroupLayout.Alignment.LEADING)
						.addGroup(
								layout
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												layout
														.createParallelGroup(
																javax.swing.GroupLayout.Alignment.LEADING)
														.addComponent(
																jSeparator1,
																javax.swing.GroupLayout.DEFAULT_SIZE,
																414,
																Short.MAX_VALUE)
														.addGroup(
																javax.swing.GroupLayout.Alignment.TRAILING,
																layout
																		.createSequentialGroup()
																		.addComponent(
																				jLabel1)
																		.addPreferredGap(
																				javax.swing.LayoutStyle.ComponentPlacement.RELATED)
																		.addComponent(
																				functionsCombo,
																				0,
																				202,
																				Short.MAX_VALUE))
														.addComponent(jLabel2)
														.addGroup(
																layout
																		.createSequentialGroup()
																		.addGap(
																				10,
																				10,
																				10)
																		.addGroup(
																				layout
																						.createParallelGroup(
																								javax.swing.GroupLayout.Alignment.LEADING)
																						.addGroup(
																								layout
																										.createSequentialGroup()
																										.addGroup(
																												layout
																														.createParallelGroup(
																																javax.swing.GroupLayout.Alignment.LEADING)
																														.addComponent(
																																jLabel3)

																														.addComponent(
																																jLabel4,
																																javax.swing.GroupLayout.DEFAULT_SIZE,
																																85,
																																Short.MAX_VALUE))
																										.addPreferredGap(
																												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
																										.addGroup(
																												layout
																														.createParallelGroup(
																																javax.swing.GroupLayout.Alignment.LEADING,
																																false)
																														.addComponent(
																																lowerBoundText)
																														.addComponent(
																																upperBoundText,
																																javax.swing.GroupLayout.DEFAULT_SIZE,
																																113,
																																Short.MAX_VALUE))
																										/*
																										 * .addGroup
																										 * (
																										 * layout
																										 * .
																										 * createParallelGroup
																										 * (
																										 * javax
																										 * .
																										 * swing
																										 * .
																										 * GroupLayout
																										 * .
																										 * Alignment
																										 * .
																										 * LEADING
																										 * ,
																										 * false
																										 * )
																										 * .
																										 * addComponent
																										 * (
																										 * populatie
																										 * )
																										 * .
																										 * addComponent
																										 * (
																										 * generatii
																										 * ,
																										 * javax
																										 * .
																										 * swing
																										 * .
																										 * GroupLayout
																										 * .
																										 * DEFAULT_SIZE
																										 * ,
																										 * 113
																										 * ,
																										 * Short
																										 * .
																										 * MAX_VALUE
																										 * )
																										 * )
																										 */
																										.addGap(
																												18,
																												18,
																												18))
																						.addGroup(
																								layout
																										.createSequentialGroup()
																										.addPreferredGap(
																												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
																										.addComponent(
																												plotButton)
																										.addPreferredGap(
																												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
																										.addComponent(
																												resetButton)
																										.addGap(
																												34,
																												34,
																												34)))
																		.addGroup(
																				layout
																						.createParallelGroup(
																								javax.swing.GroupLayout.Alignment.LEADING,
																								false)
																						.addGroup(
																								layout
																										.createSequentialGroup()
																										.addComponent(
																												jLabel6)
																										.addPreferredGap(
																												javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
																										.addComponent(
																												jLabel7))
																						.addGroup(
																								layout
																										.createSequentialGroup()
																										.addComponent(
																												jLabel5)
																										.addPreferredGap(
																												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
																										.addComponent(
																												dimensionText,
																												javax.swing.GroupLayout.PREFERRED_SIZE,
																												118,
																												javax.swing.GroupLayout.PREFERRED_SIZE))
																						.addGroup(
																								layout
																										.createSequentialGroup()
																										.addComponent(
																												jLabel8)
																										.addPreferredGap(
																												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
																										.addComponent(
																												plotPointsText)))

																		.addPreferredGap(
																				javax.swing.LayoutStyle.ComponentPlacement.RELATED,
																				10,
																				Short.MAX_VALUE)))
										.addContainerGap()));
		layout
				.setVerticalGroup(layout
						.createParallelGroup(
								javax.swing.GroupLayout.Alignment.LEADING)
						.addGroup(
								layout
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												layout
														.createParallelGroup(
																javax.swing.GroupLayout.Alignment.BASELINE)
														.addComponent(jLabel1)
														.addComponent(
																functionsCombo,
																javax.swing.GroupLayout.PREFERRED_SIZE,
																javax.swing.GroupLayout.DEFAULT_SIZE,
																javax.swing.GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
										.addComponent(
												jSeparator1,
												javax.swing.GroupLayout.PREFERRED_SIZE,
												10,
												javax.swing.GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
										.addComponent(jLabel2)
										.addPreferredGap(
												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
										.addGroup(
												layout
														.createParallelGroup(
																javax.swing.GroupLayout.Alignment.BASELINE)
														.addComponent(jLabel3)
														.addComponent(
																lowerBoundText,
																javax.swing.GroupLayout.PREFERRED_SIZE,
																javax.swing.GroupLayout.DEFAULT_SIZE,
																javax.swing.GroupLayout.PREFERRED_SIZE)
														.addComponent(jLabel5)
														.addComponent(
																dimensionText,
																javax.swing.GroupLayout.PREFERRED_SIZE,
																javax.swing.GroupLayout.DEFAULT_SIZE,
																javax.swing.GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
										.addGroup(
												layout
														.createParallelGroup(
																javax.swing.GroupLayout.Alignment.BASELINE)
														.addComponent(jLabel4)
														.addComponent(
																upperBoundText,
																javax.swing.GroupLayout.PREFERRED_SIZE,
																javax.swing.GroupLayout.DEFAULT_SIZE,
																javax.swing.GroupLayout.PREFERRED_SIZE)
														.addComponent(jLabel6)
														.addComponent(jLabel7))
										.addPreferredGap(
												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
										.addGroup(
												layout
														.createParallelGroup(
																javax.swing.GroupLayout.Alignment.LEADING)
														.addGroup(
																layout
																		.createParallelGroup(
																				javax.swing.GroupLayout.Alignment.BASELINE)
																		.addComponent(
																				plotButton)
																		.addComponent(
																				resetButton))
														.addGroup(
																layout
																		.createParallelGroup(
																				javax.swing.GroupLayout.Alignment.BASELINE)
																		.addComponent(
																				jLabel8)
																		.addComponent(
																				plotPointsText,
																				javax.swing.GroupLayout.PREFERRED_SIZE,
																				javax.swing.GroupLayout.DEFAULT_SIZE,
																				javax.swing.GroupLayout.PREFERRED_SIZE)))
										.addContainerGap(
												javax.swing.GroupLayout.DEFAULT_SIZE,
												Short.MAX_VALUE)));

		pack();
		this.setLocationRelativeTo(null);
	}

	public static void main(String[] args) {
		GO window = new GO();

		window.setVisible(true);
	}

	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == functionsCombo) {
			loadFunctionParameters();
			System.out.println(" dimensiunea "
					+ (Integer) dimensionText.getValue());
			dimPop = (Integer) dimensionText.getValue();

			// cromozom.setDim(3);
			AlgoritmGenerational((Integer) dimensionText.getValue());
		} else if (e.getSource() == resetButton) {
			{
				loadFunctionParameters();
			}
		} else if (e.getSource() == plotButton) {
			createPlot();
		}
	}

	private void createPlot() {
		switch ((Integer) dimensionText.getValue()) {
		case 1:
			create2DPlot();

			break;
		case 2:
			create3DPlot();
			break;
		default:
			AlgoritmGenerational((Integer) dimensionText.getValue());
			JOptionPane.showMessageDialog(this,
					"Afisare format text   (nu functioneaza grafic).");
			break;
		}

	}

	private void create3DPlot() {
		int valuesNumber = Integer.parseInt(plotPointsText.getText());
		double lowerBnd = Double.parseDouble(lowerBoundText.getText());
		double pitch = (Math.abs(lowerBnd) + Math.abs(Double
				.parseDouble(upperBoundText.getText())))
				/ valuesNumber;
		double[] x = increment(valuesNumber, lowerBnd, pitch);
		double[] y = increment(valuesNumber, lowerBnd, pitch);
		double[][] z = null;

		switch (functionsCombo.getSelectedIndex()) {
		case 0:
			z = ((Functie_1) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F3D(x, y);
			break;
		case 1:
			z = ((Functie_2) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F3D(x, y);
			break;
		case 2:
			z = ((Functie_3) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F3D(x, y);
			break;
		case 3:
			z = ((Functie_4) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F3D(x, y);
			break;
		case 4:
			z = ((Functie_5) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F3D(x, y);
			break;
		case 5:
			z = ((Functie_6) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F3D(x, y);
			break;
		case 6:
			z = ((Functie_7) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F3D(x, y);
			break;
		case 7:
			z = ((Functie_8) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F3D(x, y, 20, 0.2,
					2 * Math.PI);
			break;
		case 8:
			z = ((Functie_9) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F3D(x, y);
			break;
		case 9:
			z = ((Functie_10) listaFunctii.get(functionsCombo
					.getSelectedIndex())).F3D(x, y);
			break;

		default:
			break;
		}

		Plot plot = new Plot(Plot.PLOT_3D, x, y, z);
		plot.addGridPlot3D("Function", x, y, z);
		plot.setVisible(true);
	}

	private void create2DPlot() {
		int valuesNumber = Integer.parseInt(plotPointsText.getText());
		double lowerBnd = Double.parseDouble(lowerBoundText.getText());
		double pitch = (Math.abs(lowerBnd) + Math.abs(Double
				.parseDouble(upperBoundText.getText())))
				/ valuesNumber;
		double[] x = increment(valuesNumber, lowerBnd, pitch);
		double[] y = null;
		double[][] z = null;
		switch (functionsCombo.getSelectedIndex()) {
		case 0:
			y = ((Functie_1) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F2D(x);

			break;
		case 1:
			y = ((Functie_2) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F2D(x);
			break;
		case 2:
			y = ((Functie_3) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F2D(x);
			break;
		case 3:
			y = ((Functie_4) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F2D(x);
			break;
		case 4:
			y = ((Functie_5) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F2D(x);
			break;
		case 5:
			JOptionPane.showMessageDialog(this,
					"The is no 2D plot defined for this function.");
			return;
		case 6:
			y = ((Functie_7) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F2D(x);
			break;
		case 7: 
			y = ((Functie_8) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F2D(x, 20, 0.2,
					2 * Math.PI);
			break;
		case 8:
			y = ((Functie_9) listaFunctii
					.get(functionsCombo.getSelectedIndex())).F2D(x);
			break;
		case 9:
			y = ((Functie_10) listaFunctii.get(functionsCombo
					.getSelectedIndex())).F2D(x);
			break;

		default:
			break;
		}

		Plot plot = new Plot(Plot.PLOT_2D, x, y, z);
		plot.addLinePlot2D("Function", x, y);

		plot.setVisible(true);
	}

	private void loadFunctionParameters() {
		Functie function = (Functie) listaFunctii.get(functionsCombo
				.getSelectedIndex());
		lowerBoundText.setText(function.getMinX() + "");
		upperBoundText.setText(function.getMaxX() + "");
		dimensionText.setValue(2);
		plotPointsText.setText("100");

	}

	// codificare reala

	public int pop;
	public int generatii;

	public List<Cromozom> populatie = new ArrayList<Cromozom>(pop);
	public List<Cromozom> Pop = new ArrayList<Cromozom>(pop);

	public List<Cromozom> popAux = new ArrayList<Cromozom>(pop);
	Random random = new Random();

	public double suma(double[] ruleta, int ii) {
		int i;
		double sum = 0;
		for (i = 0; i < ii; i++)
			sum = sum + ruleta[i];
		return sum;
	}

	public Cromozom Selectie_ruleta() {
		int i, ii = 0;
		double r = 0;
		double fitt = 0;
		double sum = 0;
		double[] ruleta = new double[pop];

		ruleta[0] = 0;
		// Ordonare(populatie);
		for (i = 0; i < pop; i++) {
			fitt = populatie.get(i).getFitness();
			ruleta[i] = 1 / fitt;
			sum = sum + ruleta[i];
			// System.out.println (ruleta [i]+ " //" );

		}
		r = random.nextDouble();

		for (i = 0; i < pop - 1; i++) {
			if (r >= ruleta[i] && r < ruleta[i + 1])
				ii = i;

		}
		ii = random.nextInt(pop - 1);

		System.out.println("populatie[" + ii + "]="
				+ populatie.get(ii).afisare());
		return populatie.get(ii);
	}

	public void initializare() {
		for (int i = 1; i <= pop; i++)
			populatie.add(new Cromozom(dimPop));
		for (Cromozom i : populatie) {
			i.setN(dimPop);
			for (int j = 1; j <= dimPop; j++) {
				double aux;
				aux = minVal() + random.nextDouble() * (maxVal() - minVal());

				i.addToListaX(aux);

			}
			i.setFitness(fitness(i.getListaX()));
			System.out.println(i.afisare() + " fitness " + i.getFitness()
					+ "  " + "alt numar ");

		}
	}

	public void Ordonare(List<Cromozom> populatie) {
		int i, j;
		double tmp;
		for (i = 0; i < pop - 1; i++) {
			for (j = i + 1; j < pop; j++)

				if (populatie.get(i).getFitness() > populatie.get(j)
						.getFitness()) {
					tmp = populatie.get(i).getValAt(i);
					populatie.get(i).setValAtForListaX(
							populatie.get(j).getValAt(j), i);
					populatie.get(j).setValAtForListaX(tmp, j);
				}
		}

	}

	public void Afis_fitness() {
		int i;
		for (i = 1; i <= pop; i++)
			System.out.println("afis fitness popAux ");// +
		// popAux.get(i).getFitness());

	}

	public Cromozom Incrucisare(Cromozom t, Cromozom m) {
		double alfa = random.nextDouble();

		double beta = 1 - alfa;
		int i;
		double val = 0;
		Cromozom fiu = new Cromozom(dimPop);
		for (i = 0; i < dimPop; i++) {
			val = alfa * t.getValAt(i) + beta * m.getValAt(i);

			fiu.setValAtForListaX(val, i);

		}
		fiu.setFitness(fitness(fiu.getListaX()));
		System.out.println("fiu incrucisat" + fiu.afisare() + " fitness   "
				+ fiu.getFitness());
		return fiu;
	}

	public Cromozom Incrucisare_convexa(Cromozom m, Cromozom t, Cromozom fiu) {
		double pc = 0.8;// 
		double r = random.nextDouble();
		double fitM, fitT;
		Cromozom result = new Cromozom(dimPop);
		if (r < pc) {
			fiu = Incrucisare(t, m);
			// return fiu;
			result = fiu;
		} else {
			fitM = m.getFitness();
			fitT = t.getFitness();
			if (fitM > fitT)
				// return t;
				result = t;
			else
				// return m;
				result = m;
		}
		System.out.println("fiu incrucisat in convex " + result.afisare());

		return result;
	}

	public double minVal() {
		return Double.parseDouble(lowerBoundText.getText());

	}

	public double maxVal() {
		return Double.parseDouble(upperBoundText.getText());

	}

	public Cromozom Mutatie_Gaussiana(Cromozom fiu) {
		int i;
		double raza = random.nextGaussian();
		double pr = random.nextFloat();
		Cromozom fius = new Cromozom(dimPop);
		double fit = 0;
		if (pr < 0.5)
			for (i = 1; i <= dimPop; i++) {
				double val = fiu.getValAt(i - 1) - raza;

				if (fit > maxVal()) {
					fius.setValAtForListaX(maxVal(), i - 1);
				} else {
					fius.setValAtForListaX(val, i - 1);
				}
			}
		else
			for (i = 1; i <= dimPop; i++) {
				double val = fiu.getValAt(i - 1) - raza;

				if (fit < minVal()) {
					fius.setValAtForListaX(minVal(), i - 1);
				} else {
					fius.setValAtForListaX(val, i - 1);
				}
			}

		fiu.setFitness(fitness(fiu.getListaX()));
		// System.out.println("fiu mutat " + fius.afisare());
		return fiu;
	}

	public Cromozom bestFitness(List<Cromozom> popu) {
		double fit = -100000;
		Cromozom fiu = new Cromozom(dimPop);
		int i;
		for (i = 0; i < pop; i++)
			if (fit > popu.get(i).getFitness())
				fiu = popu.get(i);

		return fiu;
	}

	public double fitness(List<Double> x) {
		double y = 0;
		switch (functionsCombo.getSelectedIndex()) {
		case 0:
			y = ((Functie_1) listaFunctii
					.get(functionsCombo.getSelectedIndex())).Fitness(x);
			// System.out.println("fitness de "+x+" = "+y+"------");
			break;

		case 1:
			y = ((Functie_2) listaFunctii
					.get(functionsCombo.getSelectedIndex())).Fitness(x);
			// System.out.println("fitness de "+x+" = "+y+"------");
			break;
		case 2:
			y = ((Functie_3) listaFunctii
					.get(functionsCombo.getSelectedIndex())).Fitness(x);
			// System.out.println("fitness de "+x+" = "+y+"------");

			break;
		case 3:
			y = ((Functie_4) listaFunctii
					.get(functionsCombo.getSelectedIndex())).Fitness(x);
			break;
		case 4:
			y = ((Functie_5) listaFunctii
					.get(functionsCombo.getSelectedIndex())).Fitness(x);
			// System.out.println("fitness de "+x+" = "+y+"------");
			break;
		case 5:
			JOptionPane.showMessageDialog(this,
					"The is no 2D plot defined for this function.");
			return y;
		case 6:
			y = ((Functie_7) listaFunctii
					.get(functionsCombo.getSelectedIndex())).Fitness(x);
			// System.out.println("fitness de "+x+" = "+y+"------");

			break;
		case 7: // nu merge!!!!ceva
			y = ((Functie_8) listaFunctii
					.get(functionsCombo.getSelectedIndex())).Fitness(x, 20,
					0.2, 2 * Math.PI);

			// System.out.println("fitness de "+x+" = "+y+"------");
			break;
		case 8:
			y = ((Functie_9) listaFunctii
					.get(functionsCombo.getSelectedIndex())).Fitness(x);
			// System.out.println("fitness de "+x+" = "+y+"------");
			break;
		case 9:
			y = ((Functie_10) listaFunctii.get(functionsCombo
					.getSelectedIndex())).Fitness(x);
			// System.out.println("fitness de "+x+" = "+y+"------");
			break;
		default:
			break;
		}
		return y;
	}

	public void copiazaPopulatie(List<Cromozom> popAux) {
		for (int i = 0; i < pop; i++)
			Pop.add(i, popAux.get(i));
	}

	public void afis() {
		for (Cromozom i : populatie)
			i.toString();
		System.out.println("---");
	}

	public void AlgoritmGenerational(int n) {
		int i, j;
		dimPop = n;

		List<Cromozom> popAux = new ArrayList<Cromozom>(dimPop);
		Cromozom m, t, sup, best = null;
		Cromozom fiu = null;
		sup = new Cromozom(dimPop);

		initializare();

		for (i = 0; i < generatii; i++) {
			System.out.println(" Generatia " + i);
			popAux.add(0, bestFitness(populatie));
			for (j = 1; j < pop; j++) {
				double min = 100000;
				System.out.println("mama si tata");
				m = Selectie_ruleta();
				t = Selectie_ruleta();
				fiu = Incrucisare_convexa(m, t, fiu);
				fiu = Mutatie_Gaussiana(fiu);
				if (min > fiu.getFitness())
					best = fiu;
				popAux.add(j, fiu);

				popAux.get(j).afisare();
			}// j //noua generatie facuta
			// Afis_fitness();
			System.out.println(" cel mai bun din generatia  " + i
					+ best.afisare() + "     " + best.getFitness());
			if (best.getFitness() < sup.getFitness())
				sup = best;
			copiazaPopulatie(popAux);
		}// i

		fiu = bestFitness(popAux);
		System.out.println("solutia cea mai buna  " + best.afisare() + "  "
				+ best.getFitness());

	}
}
