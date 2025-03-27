package pizzax.repository.mock;

import java.util.ArrayList;

import pizzax.model.Pizza;
import pizzax.repository.PizzaRepository;
import pizzax.repository.RepositoryException;
import pizzax.validation.DefaultPizzaValidator;
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
		Errors errors = new Errors();
		pizzaValidator.validate(pizza, errors);
		if (errors.getErrorCount() > 0)
			throw new RepositoryException(errors);
		for(Pizza p: pizzaList)
			if(p.getCode().equals(pizza.getCode())) {
				errors.reject("entity.duplicate.id");
				throw new RepositoryException(errors);
			}
		pizzaList.add(pizza);
	}

	public void remove(String pizzaCode) {
		int i = 0;
		for(; i <pizzaList.size(); i++)
			if (pizzaList.get(i).getCode().equals(pizzaCode))
				break;
		if (i < pizzaList.size()) {
			pizzaList.remove(i);
		} else {
			Errors errors = new Errors();
			errors.reject("entity.remove.notfound");
			throw new RepositoryException(errors);
		}
	}

	public void setValidator(Validator<Pizza> pizzaValidator) {
		this.pizzaValidator = pizzaValidator;
	}

}
