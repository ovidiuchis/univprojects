package pizzax.ui;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import pizzax.ApplicationCoordinator;
import pizzax.control.PizzaCrudController;
import pizzax.model.Pizza;

public class PizzaListFrame implements ActionListener {

	private JButton btnCreate;
	private JButton btnRead;
	private JFrame frame;
	private JList pizzaList;
	private JButton btnUpdate;
	private JButton btnDelete;
	private ApplicationCoordinator application;
	private PizzaCrudController pizzaCrudController;

	public PizzaListFrame(ApplicationCoordinator application,
			PizzaCrudController pizzaCrudController) {
		this.application = application;
		this.pizzaCrudController = pizzaCrudController;
		frame = new JFrame("Pizza CRUD");
		JPanel p1 = new JPanel();
		p1.add(new JLabel("Pizza list"));
		pizzaList = new JList(pizzaCrudController.getPizzaListModel());
		p1.add(pizzaList);

		p1.setLayout(new GridLayout(2, 1));
		JPanel p2 = new JPanel();
		p2.add(btnCreate = new JButton("Create"));
		btnCreate.addActionListener(this);
		p2.add(btnRead = new JButton("Read"));
		btnRead.addActionListener(this);
		p2.add(btnUpdate = new JButton("Update"));
		btnUpdate.addActionListener(this);
		p2.add(btnDelete = new JButton("Delete"));
		btnDelete.addActionListener(this);
		p2.setLayout(new GridLayout(1, 4));
		JPanel p = new JPanel();
		p.add(p1);
		p.add(p2);
		p.setLayout(new GridLayout(2, 1));
		frame.getContentPane().add(p);
		frame.pack();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == btnCreate)
			application.createPizza();
		else if (e.getSource() == btnRead) {
			if (pizzaList.getSelectedIndex() == -1)
				JOptionPane.showMessageDialog(frame, "Select a pizza first!");
			else
				application.showPizza((Pizza) pizzaList.getModel()
						.getElementAt(pizzaList.getSelectedIndex()));
		} else if (e.getSource() == btnUpdate) {
			if (pizzaList.getSelectedIndex() == -1)
				JOptionPane.showMessageDialog(frame, new String(
						"Selectati o pizza!"));
			else
				application.editPizza((Pizza) pizzaList.getModel()
						.getElementAt(pizzaList.getSelectedIndex()));
		} else if (e.getSource() == btnDelete) {
			if (pizzaList.getSelectedIndex() == -1)
				JOptionPane.showMessageDialog(frame, "Select a pizza first!");
			else {
				if (JOptionPane.showConfirmDialog(null, "Do you want to delete?",
						"Delete a pizza", JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION)
					pizzaCrudController.delete((Pizza) pizzaList.getModel()
							.getElementAt(pizzaList.getSelectedIndex()));
			}
		}

	}

	public void setVisible(boolean b) {
		frame.setVisible(true);
	}

}
