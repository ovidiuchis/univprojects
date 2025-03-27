package pizzax.repository.mock;

import java.util.ArrayList;
import java.util.List;

import pizzax.model.Pizza;
import pizzax.repository.PizzaRepository;
import pizzax.repository.RepositoryException;
import pizzax.validation.Errors;
import pizzax.validation.Validator;

public class PizzaRepositoryMock implements PizzaRepository {

	private ArrayList<Pizza> pizzaList = new ArrayList<Pizza>();
	private Validator<Pizza> pizzaValidator;

	public Pizza findById(String pizzaCode) {
		for(Pizza p: pizzaList)
			if(p.getCode().equals(pizzaCode)) 
				return p;
		return null;
	}

	public void save(Pizza pizza) {
		validatePizza(pizza);
		for(Pizza p: pizzaList)
			if(p.getCode().equals(pizza.getCode())) {
				throw new RepositoryException();
			}
		pizzaList.add(pizza);
	}

	private void validatePizza(Pizza pizza) {
		Errors errors = new Errors();
		pizzaValidator.validate(pizza, errors);
		if (errors.getErrorCount() > 0)
			throw new RepositoryException(errors);
	}

	public void remove(String pizzaCode) {
		int i = 0;
		for(; i <pizzaList.size(); i++)
			if (pizzaList.get(i).getCode().equals(pizzaCode))
				break;
		if (i < pizzaList.size()) {
			pizzaList.remove(i);
		} else {
			throw new RepositoryException();
		}
	}

	public void setValidator(Validator<Pizza> pizzaValidator) {
		this.pizzaValidator = pizzaValidator;
	}

	public void update(String code, Pizza newPizza) {
		validatePizza(newPizza);
		int i = 0;
		for(; i <pizzaList.size(); i++)
			if (pizzaList.get(i).getCode().equals(code))
				break;
		if (i < pizzaList.size()) {
			pizzaList.set(i, newPizza);
		} else {
			throw new RepositoryException();
		}

	}

	public List<Pizza> findAll() {
		return pizzaList;
	}

}
