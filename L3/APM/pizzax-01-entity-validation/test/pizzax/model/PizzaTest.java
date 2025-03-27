package pizzax.model;

import junit.framework.TestCase;
import pizzax.validation.DefaultPizzaValidator;
import pizzax.validation.Errors;
import pizzax.validation.Validator;

public class PizzaTest extends TestCase {

	private static final double CHEESE_PIZZA_PRICE = 9.5;
	private static final String CHEESE_PIZZA_DESCRIPTION = "Cheese pizza";
	private static final String CHEESE_PIZZA_CODE = "cheese";

	private Pizza cheesePizza;
	
	protected void setUp() throws Exception {
		cheesePizza = newCheesePizza();
	}
	
	public void testCreate() {
		assertEquals(CHEESE_PIZZA_CODE, cheesePizza.getCode());
		assertEquals(CHEESE_PIZZA_DESCRIPTION, cheesePizza
				.getDescription());
		assertEquals(CHEESE_PIZZA_PRICE, cheesePizza.getPrice());
	}

	public void testEquals() {
		assertEquals(cheesePizza, newCheesePizza());
		assertFalse(cheesePizza.equals(new Pizza()));
	}

	public void testValidate() {
		Validator<Pizza> validator = new DefaultPizzaValidator();
		Errors errors = new Errors();
		validator.validate(cheesePizza, errors);
		assertEquals(0, errors.getErrorCount());
		//errors.clear();
		validator.validate(new Pizza(), errors);
		assertEquals(3, errors.getErrorCount());
		assertTrue(errors.hasFieldErrors(Pizza.CODE_FIELD));
		assertTrue(errors.hasFieldErrors(Pizza.DESCRIPTION_FIELD));
		assertTrue(errors.hasFieldErrors(Pizza.PRICE_FIELD));
	}

	private static Pizza newCheesePizza() {
		Pizza pizza = new Pizza();
		pizza.setCode(CHEESE_PIZZA_CODE);
		pizza.setDescription(CHEESE_PIZZA_DESCRIPTION);
		pizza.setPrice(CHEESE_PIZZA_PRICE);
		return pizza;
	}

}
