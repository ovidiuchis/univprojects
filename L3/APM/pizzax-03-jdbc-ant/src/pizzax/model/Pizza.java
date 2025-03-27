package pizzax.model;

public class Pizza {

	public static final String CODE_FIELD = "code";
	public static final String DESCRIPTION_FIELD = "description";
	public static final String PRICE_FIELD = "price";
	
	private String code;
	private String description;
	private double price;

	public String getCode() {
		return code;
	}

	public double getPrice() {
		return price;
	}

	public String getDescription() {
		return description;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean equals(Object obj) {
		if (!(obj instanceof Pizza))
			return false;
		Pizza that = (Pizza) obj;
		if ((this.code != null) && (!this.code.equals(that.code)))
			return false;
		if ((this.description != null) && (!this.description.equals(that.description)))
			return false;
		if (this.price != that.price)
			return false;
		return true;
	}
	
	public int hashCode() {
		int hash = 1;
		hash = hash * 31 + (code != null? code.hashCode(): 0);
		hash = hash * 31 + (description != null? description.hashCode(): 0);
		hash = hash * 31 + Double.valueOf(price).hashCode();
		return hash;
	}

}
