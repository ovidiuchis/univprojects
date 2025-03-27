package pizzax;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pizzax.control.PizzaCrudController;
import pizzax.model.Pizza;
import pizzax.ui.PizzaFrame;
import pizzax.ui.PizzaListFrame;

public class ApplicationCoordinator {
	
	PizzaCrudController pizzaCrudController;
	
	public void setPizzaCrudController(PizzaCrudController pizzaCrudController) {
		this.pizzaCrudController = pizzaCrudController;
	}

	public static void main(String[] args) {
		ApplicationContext factory = new ClassPathXmlApplicationContext(
		"classpath:applicationContext.xml");
		ApplicationCoordinator application = (ApplicationCoordinator) factory.getBean("application");
		application.start();
	}

	private void start() {
		new PizzaListFrame(this, pizzaCrudController).setVisible(true);
	}

	public void createPizza() {
		new PizzaFrame(pizzaCrudController).setVisible(true);		
	}

	public void showPizza(Pizza pizza) {
		new PizzaFrame(pizza).setVisible(true);		
	}

	public void editPizza(Pizza pizza) {
		new PizzaFrame(pizzaCrudController, pizza).setVisible(true);				
	}
	
}
