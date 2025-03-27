package pizzax.model;

public class MockFactory {

	static final String CHEESE_PIZZA_CODE = "cheese";
	static final String CHEESE_PIZZA_DESCRIPTION = "Cheese pizza";
	static final double CHEESE_PIZZA_PRICE = 9.5;
	
	public static Pizza newCheesePizza() {
		Pizza pizza = new Pizza();
		pizza.setCode(CHEESE_PIZZA_CODE);
		pizza.setDescription(CHEESE_PIZZA_DESCRIPTION);
		pizza.setPrice(CHEESE_PIZZA_PRICE);
		return pizza;
	}

}
