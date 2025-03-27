package pizzax.repository;

import pizzax.model.Pizza;
import pizzax.validation.Validator;

public interface PizzaRepository {

	void setValidator(Validator<Pizza> pizzaValidator);

	void save(Pizza cheesePizza);

	Pizza findById(String pizzaCode);

	void remove(String pizzaCode);

}
