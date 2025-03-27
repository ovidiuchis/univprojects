package pizzax.ui;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import pizzax.control.PizzaCrudController;
import pizzax.model.Pizza;
import pizzax.repository.RepositoryException;
import pizzax.validation.ValidationException;

public class PizzaFrame extends JFrame implements ActionListener {
	private JButton btnOk;
	private JButton btnCancel;
	private JTextField txtCode;
	private JTextField txtDescr;
	private JTextField txtPrice;
	private PizzaCrudController pizzaCrudController;
	private Pizza pizza;
	private JButton btnClose;

	public PizzaFrame(PizzaCrudController pizzaCrudController) {
		this.pizzaCrudController = pizzaCrudController;
		createContentPane();
	}

	public PizzaFrame(PizzaCrudController pizzaCrudController, Pizza pizza) {
		this.pizza = pizza;
		this.pizzaCrudController = pizzaCrudController;
		createContentPane();
		fillData(pizza);
		txtCode.setEnabled(false);
	}
	
	private void createContentPane() {
		JPanel p = new JPanel();
		p.add(new JLabel("Code"));
		p.add(txtCode = new JTextField());
		p.add(new JLabel("Desen"));
		p.add(txtDescr = new JTextField());
		p.add(new JLabel("Price"));
		p.add(txtPrice = new JTextField());
		if (pizza != null && pizzaCrudController == null) {
			p.add(btnClose = new JButton("Close"));
			btnClose.addActionListener(this);
		} else {
			p.add(btnOk = new JButton("Ok"));
			btnOk.addActionListener(this);
			p.add(btnCancel = new JButton("Cancel"));
			btnCancel.addActionListener(this);
		}
		p.setLayout(new GridLayout(4, 2));
		this.getContentPane().add(p);
		this.pack();
	}

	public PizzaFrame(Pizza pizza) {
		this.pizza = pizza;
		createContentPane();
		fillData(pizza);

		txtCode.setEnabled(false);
		txtDescr.setEnabled(false);
		txtPrice.setEnabled(false);
	}

	private void fillData(Pizza pizza) {
		txtCode.setText("" + pizza.getCode());
		txtDescr.setText(this.pizza.getDescription());
		txtPrice.setText("" + pizza.getPrice());
	}


	public void actionPerformed(ActionEvent event) {
		if (event.getSource() == btnOk) {
			try {
				if (pizza == null) {
					pizzaCrudController.createPizza(txtCode
							.getText(), txtDescr.getText(), Double
							.parseDouble(txtPrice.getText()));
					
				} else {
					pizzaCrudController.updatePizza(pizza, txtCode
							.getText(), txtDescr.getText(), Double
							.parseDouble(txtPrice.getText()));
				}
				this.dispose();
			} catch (NumberFormatException e) {
				JOptionPane.showMessageDialog(this,
						"Enter a number for price!");
			} catch (ValidationException validationException) {
				JOptionPane.showMessageDialog(this, validationException.getErrors().toString());
			} catch (RepositoryException repositoryException) {
				JOptionPane.showMessageDialog(this, "Repository exception: " + repositoryException.getMessage());
			}
		} else {
			this.dispose();
		}

	}
}
