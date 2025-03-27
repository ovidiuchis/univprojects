package pizzax.control;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.swing.AbstractListModel;

import pizzax.model.Pizza;
import pizzax.repository.PizzaRepository;

public class PizzaListModel extends AbstractListModel {

	private PizzaRepository pizzaRepository;

	public void setPizzaRepository(PizzaRepository pizzaRepository) {
		this.pizzaRepository = pizzaRepository;
	}

	private List<Pizza> pizzaList = null;

	public List<Pizza> getPizzaList() {
		if (pizzaList == null) {
			pizzaList = pizzaRepository.findAll();
			Collections.sort(pizzaList, new Comparator<Pizza>() {
				public int compare(Pizza a, Pizza b) {
					return a.getDescription().compareTo(b.getDescription());
				}

			});
		}
		return pizzaList;
	}

	public Object getElementAt(int index) {
		return getPizzaList().get(index);
	}

	public int getSize() {
		return getPizzaList().size();
	}

	public void pizzaAdded() {
		pizzaList = null;
		fireIntervalAdded(this, getSize(), getSize());
	}

	public void pizzaUpdated() {
		pizzaList = null;
		fireContentsChanged(this, 0, getSize());
	}

	public void pizzaDeleted() {
		pizzaList = null;
		fireIntervalRemoved(this, 0, getSize());
	}

}
