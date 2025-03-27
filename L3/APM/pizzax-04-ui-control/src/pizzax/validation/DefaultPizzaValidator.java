package pizzax.validation;

import pizzax.model.Pizza;

public class DefaultPizzaValidator implements Validator<Pizza> {

	private static final String PIZZA_CODE_ERROR = "pizza.code.error";
	private static final String PIZZA_DESCRIPTION_ERROR = "pizza.description.error";
	private static final String PIZZA_PRICE_ERROR = "pizza.price.error";
	public static final String DUPLICATE_ID_ERROR = "pizza.duplicate.id.error";

	public void validate(Pizza pizza, Errors errors) {
		String pizzaCode = pizza.getCode();
		if ((pizzaCode == null) || pizzaCode.equals(""))
			errors.rejectValue(Pizza.CODE_FIELD, PIZZA_CODE_ERROR);
		String pizzaDescription = pizza.getDescription();
		if ((pizzaDescription == null) || pizzaDescription.equals(""))
			errors
					.rejectValue(Pizza.DESCRIPTION_FIELD,
							PIZZA_DESCRIPTION_ERROR);
		if (pizza.getPrice() <= 0)
			errors.rejectValue(Pizza.PRICE_FIELD, PIZZA_PRICE_ERROR);
	}

}
