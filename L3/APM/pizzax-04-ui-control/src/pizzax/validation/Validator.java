package pizzax.validation;

public interface Validator<T> {

	void validate(T object, Errors errors);

}
