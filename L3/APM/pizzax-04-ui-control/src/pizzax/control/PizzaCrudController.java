package pizzax.control;

import pizzax.model.Pizza;
import pizzax.repository.PizzaRepository;
import pizzax.validation.Errors;
import pizzax.validation.ValidationException;
import pizzax.validation.Validator;

public class PizzaCrudController {

	private PizzaRepository pizzaRepository;
	public void setPizzaRepository(PizzaRepository pizzaRepository) {
		this.pizzaRepository = pizzaRepository;
	}

	private PizzaListModel pizzaListModel;
	public void setPizzaListModel(PizzaListModel pizzaListModel) {
		this.pizzaListModel = pizzaListModel;
	}

	private Validator<Pizza> pizzaValidator;
	public void setPizzaValidator(Validator<Pizza> pizzaValidator) {
		this.pizzaValidator = pizzaValidator;
	}

	public void createPizza(String code, String descr, double price) {
		Pizza newPizza = createPizzaAndValidate(code, descr, price);
		pizzaRepository.save(newPizza);
		pizzaListModel.pizzaAdded();
	}

	private Pizza createPizzaAndValidate(String code, String descr, double price) {
		Pizza newPizza = new Pizza();

		newPizza.setCode(code);
		newPizza.setDescription(descr);
		newPizza.setPrice(price);

		if (pizzaValidator != null) {
			Errors errors = new Errors();
			pizzaValidator.validate(newPizza, errors);

			if (errors.getErrorCount() > 0)
				throw new ValidationException(errors);
		}
		return newPizza;
	}

	public PizzaListModel getPizzaListModel() {
		return pizzaListModel;
	}

	public void updatePizza(Pizza pizza, String code, String descr, double price) {
		Pizza newPizza = createPizzaAndValidate(code, descr, price);

		pizzaRepository.update(pizza.getCode(), newPizza);
		pizzaListModel.pizzaUpdated();
	}

	public void delete(Pizza pizza) {
		pizzaRepository.remove(pizza.getCode());
		pizzaListModel.pizzaDeleted();
	}
	
}
