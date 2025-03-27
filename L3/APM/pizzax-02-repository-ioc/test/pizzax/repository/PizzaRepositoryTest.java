package pizzax.repository;

import junit.framework.TestCase;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pizzax.model.MockFactory;
import pizzax.model.Pizza;
import pizzax.repository.mock.PizzaRepositoryMock;
import pizzax.validation.DefaultPizzaValidator;

public class PizzaRepositoryTest extends TestCase {

	private PizzaRepository pizzaRepository;

	protected void setUp() throws Exception {
		/*
		pizzaRepository = new PizzaRepositoryMock();
		pizzaRepository.setValidator(new DefaultPizzaValidator());
		*/
		
		ApplicationContext factory = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		pizzaRepository = (PizzaRepository) factory.getBean("pizzaRepository");
		
		super.setUp();
	}

	public void testSave() {
		Pizza cheesePizza = MockFactory.newCheesePizza();
		pizzaRepository.save(cheesePizza);
		assertEquals(cheesePizza, pizzaRepository.findById(cheesePizza.getCode()));
		try {
			pizzaRepository.save(MockFactory.newCheesePizza());
			fail("Repository exception: duplicate id");
		} catch(RepositoryException ex) { }
		pizzaRepository.remove(cheesePizza.getCode());
		assertNull(pizzaRepository.findById(cheesePizza.getCode()));
		try {
			pizzaRepository.save(new Pizza());
			fail("Repository exception: invalid entity");
		} catch(RepositoryException ex) { }
	}
	
}
