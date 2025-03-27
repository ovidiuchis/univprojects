package pizzax.validation;

public class ValidationException extends RuntimeException {

	private Errors errors;

	public Errors getErrors() {
		return errors;
	}

	public ValidationException(Errors errors) {
		this.errors = errors;
	}

}
