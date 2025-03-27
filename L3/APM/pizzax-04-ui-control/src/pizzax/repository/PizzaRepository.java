package pizzax.repository;

import java.util.List;

import pizzax.model.Pizza;
import pizzax.validation.Validator;

public interface PizzaRepository {

	void setValidator(Validator<Pizza> pizzaValidator);

	void save(Pizza newPizza);

	Pizza findById(String pizzaCode);

	void remove(String pizzaCode);

	void update(String code, Pizza pizza);

	List<Pizza> findAll();

}
