package pizzax.repository.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;

import pizzax.model.Pizza;
import pizzax.repository.PizzaRepository;
import pizzax.repository.RepositoryException;
import pizzax.validation.Errors;
import pizzax.validation.Validator;

public class PizzaRepositoryJdbc extends SimpleJdbcDaoSupport implements
		PizzaRepository {

	private Validator<Pizza> pizzaValidator = null;

	public void setValidator(Validator<Pizza> pizzaValidator) {
		this.pizzaValidator = pizzaValidator;
	}

	public void remove(String pizzaCode) {
		getSimpleJdbcTemplate().update("Delete from Pizzas where code = ?",
				pizzaCode);
	}

	public void save(Pizza pizza) {
		Errors errors = new Errors();
		pizzaValidator.validate(pizza, errors);
		if (errors.getErrorCount() > 0)
			throw new RepositoryException(errors);
		try {
			getSimpleJdbcTemplate()
					.update(
							"Insert into Pizzas(code, description, price) values (?, ?, ?)",
							pizza.getCode(), pizza.getDescription(),
							pizza.getPrice());
		} catch (Exception ex) {
			errors.reject("entity.duplicate.id");
			throw new RepositoryException(errors);
		}
	}

	public Pizza findById(String pizzaCode) {
		List<Pizza> pizzas = getSimpleJdbcTemplate().query(
				"select code, description, price from Pizzas where code = '"
						+ pizzaCode + "'", new PizzaMapper());
		if (pizzas.size() == 0)
			return null;
		else
			return pizzas.get(0);
	}

	private static class PizzaMapper implements ParameterizedRowMapper<Pizza> {
		public Pizza mapRow(ResultSet rs, int rowNum) throws SQLException {
			Pizza p = new Pizza();
			p.setCode(rs.getString("code"));
			p.setDescription(rs.getString("description"));
			p.setPrice(rs.getDouble("price"));
			return p;
		}
	}

}
