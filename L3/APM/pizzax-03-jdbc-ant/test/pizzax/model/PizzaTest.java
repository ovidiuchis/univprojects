package pizzax.model;

import junit.framework.TestCase;
import pizzax.validation.DefaultPizzaValidator;
import pizzax.validation.Errors;
import pizzax.validation.Validator;

public class PizzaTest extends TestCase {

	private Pizza cheesePizza;
	
	protected void setUp() throws Exception {
		cheesePizza = MockFactory.newCheesePizza();
	}
	
	public void testCreate() {
		assertEquals(MockFactory.CHEESE_PIZZA_CODE, cheesePizza.getCode());
		assertEquals(MockFactory.CHEESE_PIZZA_DESCRIPTION, cheesePizza
				.getDescription());
		assertEquals(MockFactory.CHEESE_PIZZA_PRICE, cheesePizza.getPrice());
	}

	public void testEquals() {
		assertEquals(cheesePizza, MockFactory.newCheesePizza());
		assertFalse(cheesePizza.equals(new Pizza()));
	}

	public void testValidate() {
		Validator<Pizza> validator = new DefaultPizzaValidator();
		Errors errors = new Errors();
		validator.validate(cheesePizza, errors);
		assertEquals(0, errors.getErrorCount());
		errors.clear();
		validator.validate(new Pizza(), errors);
		assertEquals(3, errors.getErrorCount());
		assertTrue(errors.hasFieldErrors(Pizza.CODE_FIELD));
		assertTrue(errors.hasFieldErrors(Pizza.DESCRIPTION_FIELD));
		assertTrue(errors.hasFieldErrors(Pizza.PRICE_FIELD));
	}

}
